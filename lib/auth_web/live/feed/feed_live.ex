defmodule AuthWeb.FeedLive do
  use AuthWeb, :live_view
  alias Auth.{Accounts, Post, Comment, SimpleS3Upload}


  @impl true
  def mount(_params, session, socket) do
    if connected?(socket) do
      Post.subscribe()
      Comment.subscribe()
    end
    limite = 6
    user = Accounts.get_user_by_session_token(session["user_token"])
    posts_map =
      Post.get_posts(limite)
      |> Enum.reduce(%{}, fn post, acc -> Map.put(acc, post.id, post) end)

    {:ok,
      socket
      |> Phoenix.LiveView.assign(uploaded_files: [])
      |> Phoenix.LiveView.allow_upload(:img, accept: ~w(.png .jpg .jpeg), max_entries: 1, auto_upload: false, external: &SimpleS3Upload.presign_upload/2)
      |> assign(
        current_user: user,
        posts: posts_map,
        has_more_posts: true,
        text: "",
        error: ""
      ) #, temporary_assigns: [posts: []]
    }
  end


  @impl true
  def handle_info({:post_created, post}, socket) do
    updated_posts = Map.put(socket.assigns.posts, post.id, post)
    {:noreply, assign(socket, posts: updated_posts)}
  end

  @impl true
  def handle_info({:post_updated, updated_post}, socket) do
    updated_posts = Map.put(socket.assigns.posts, updated_post.id, updated_post)
    {:noreply, assign(socket, posts: updated_posts)}
  end

#  @impl true
#  def handle_info({:comment_created, _comment}, socket) do
#    {:noreply, update(socket, :posts, fn posts -> [post | posts] end)}
#  end

  @impl true
  def handle_event("save", %{"text" => text}, socket) do
    photo_url = get_photo_url(socket)

    Post.create_post(
      %{
        text: text,
        user_id: socket.assigns.current_user.id,
        photo_url: photo_url
      }
    )
    {:noreply, socket}
  end


  @impl true
  def handle_event("like", %{"post_id" => post_id}, socket) do
    {post_id, _} = Integer.parse(post_id)
    post = Map.get(socket.assigns.posts, post_id)
    current_user_id = socket.assigns.current_user.id

    updated_post = if current_user_id not in post.liked_by do
      Post.inc_like(post, current_user_id) # Add
    else
      Post.dec_like(post, current_user_id) # Remove
    end

    updated_posts = Map.put(socket.assigns.posts, updated_post.id, updated_post)
    {:noreply, assign(socket, posts: updated_posts)}
  end

  @impl true
  def handle_event("save_comment", %{"text-comment" => text_comment, "postid" => post_id}, socket) do
    %{
      user_id: socket.assigns.current_user.id,
      post_id: post_id,
      text: text_comment
    }
    |> Comment.create_comment()
    {:noreply, socket}
  end

  @impl true
  def handle_event("validate", %{"text" =>  input_text}, socket) do
      if socket.assigns.uploads.img.entries != [] do
        # Tratar o erro :not_accepted e :too_large, upload_errors não está retornando-os
        for err <- Phoenix.LiveView.Helpers.upload_errors(socket.assigns.uploads.img) do
          err |> error_to_string()
          |> IO.inspect()
        end
#        IO.inspect(socket.assigns.uploads.img.entries)
      end
    {:noreply, assign(socket, text: input_text)}
  end


  @impl true
  def handle_event("cancel-entry", %{"ref" => ref}, socket) do
    {:noreply, Phoenix.LiveView.cancel_upload(socket, :img, ref)}
  end

  @impl true
  def handle_event("load-more", _params, socket) do
    limite = 6
    last_post_id = socket.assigns.posts |> Map.keys |> List.first
    more_posts = Post.load_more_posts(last_post_id, limite)

    more_posts_map = Enum.reduce(more_posts, %{}, fn post, acc ->
      Map.put(acc, post.id, post)
    end)

    updated_posts = Map.merge(socket.assigns.posts, more_posts_map)
    has_more_posts = length(more_posts) == limite

    {:noreply, assign(socket, posts: updated_posts, has_more_posts: has_more_posts)}
  end


  defp get_photo_url(socket) do
    uploaded_file_url = consume_uploaded_entries(socket, :img, fn _, entry ->
      {:ok, SimpleS3Upload.entry_url(socket.assigns.current_user.id, entry)}
    end)
    url_or_nil(List.first(uploaded_file_url), nil)
  end
  defp url_or_nil(s3_url, photo_url) when is_nil(s3_url), do: photo_url
  defp url_or_nil(s3_url, _photo_url), do: s3_url

  @doc """
    Trata o erro vindo de um atom subsequente da função `upload_error` e retorna uma string contendo o significado do erro em português.
  """
  def error_to_string(:too_large), do: "Arquivo muito grande!"
  def error_to_string(:not_accepted), do: "Você selecionou um arquivo não aceito!"
  def error_to_string(:too_many_files), do: "Você selecionou muitos arquivos!"

end
