defmodule AuthWeb.ProfileLive do
  use AuthWeb, :live_view
  alias Auth.{Accounts, Post, Comment}


  @impl true
  def mount(%{"username" => username}, session, socket) do
    if connected?(socket) do
      Post.subscribe()
      Comment.subscribe()
    end
    limite = 6
    user = Accounts.get_user_by_username(username)
    {:ok,
      socket
      |> assign(
        user: user,
        current_user: Accounts.get_user_by_session_token(session["user_token"]),
        posts: Post.get_posts_by_user_id(user.id, limite),
        has_more_posts: true
      )
    }
  end


  @impl true
  def handle_info({:post_created, post}, socket) do
    {:noreply, update(socket, :posts, fn posts -> [post | posts] end)}
  end

  @impl true
  def handle_info({:post_updated, updated_post}, socket) do
    new_posts = Enum.map(socket.assigns.posts, fn post ->
      if post.id == updated_post.id, do: updated_post, else: post
    end)
    {:noreply, assign(socket, posts: new_posts)}
  end


  @impl true
  def handle_event("like", %{"post_id" => post_id}, socket) do
    post = Post.get_post(post_id)
    current_user_id = socket.assigns.current_user.id

    if current_user_id not in post.liked_by do
      Post.inc_like(post, current_user_id) # Add
    else
      Post.dec_like(post, current_user_id) # Remove
    end
    {:noreply, socket}
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

  def handle_event("load-more", _params, socket) do
    limite = 6
    last_post_id = socket.assigns.posts |> List.last |> Map.get(:id)
    more_posts = Post.load_more_posts_by_user_id(
      last_post_id,
      socket.assigns.user.id,
      limite
    )

    new_posts = socket.assigns.posts ++ more_posts
    has_more_posts = length(more_posts) == limite
    {:noreply, assign(socket, posts: new_posts, has_more_posts: has_more_posts)}
  end

end
