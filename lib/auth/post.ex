defmodule Auth.Post do
  import Ecto.Changeset
  import Ecto.Query
  use Ecto.Schema
  use Timex
  alias Auth.{Repo, Post, Comment}
  alias Auth.Accounts.User

  schema "posts" do
    belongs_to :user, User
    field :text, :string
    field :date, :date
    field :time, :time
    field :likes, :integer, default: 0
    field :liked_by, {:array, :integer}, default: [] # users id`s likes
    field :photo_url, :string
    has_many :comments, Comment

    timestamps()
  end

  def changeset(post, attrs) do
    post
    |> cast(attrs, [
        :user_id,
        :text,
        :date,
        :time,
        :likes,
        :liked_by,
        :photo_url
      ])
    |> validate_required([:user_id, :text]) #, :date, :time
    |> validate_length(:text, min: 4, max: 400)
  end

  def create_post(attrs) do
    {date, time} = get_brazilian_datetime()
    %__MODULE__{}
    |> changeset(Map.merge(attrs, %{date: date, time: time}))
    |> Repo.insert()
    |> broadcast(:post_created)
  end

  def update_post(post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
    |> broadcast(:post_created)
  end

  def delete_post(post) do
    Repo.delete(post)
  end

  def get_post(id) do
    Repo.get(Post, id)
  end

  @doc """
    Get all posts in the Repo
  """
  def list_posts do
    Repo.all(from p in Post, order_by: [desc: p.id])
  end

  @doc """
  Busca os posts mais recentes até um limite especificado.

  ## Parâmetros

  - `limite`: O número máximo de posts a serem retornados.

  ## Retorna

  Uma lista de posts, ordenados por ID em ordem decrescente.

  """
  def get_posts(limite) do
    Repo.all(from p in Post, order_by: [desc: p.id], limit: ^limite)
  end

  @doc """
  Busca os posts de um usuário específico até um limite especificado.

  ## Parâmetros

  - `user_id`: O ID do usuário cujos posts estão sendo buscados.
  - `limite`: O número máximo de posts a serem retornados.

  ## Retorna

  Uma lista de posts do usuário especificado, ordenados por ID em ordem decrescente.

  """
  def get_posts_by_user_id(user_id, limite) do
    Repo.all(from p in Post, where: p.user_id == ^user_id, order_by: [desc: p.id], limit: ^limite)
  end

  @doc """
  Carrega mais posts do que os já existentes até um limite especificado, com base no ID do último post.

  ## Parâmetros

  - `last_post_id`: O ID do último post existente.
  - `limite`: O número máximo de posts a serem retornados.

  ## Retorna

  Uma lista de posts com ID menores que o post com o ID especificado, ordenados por ID em ordem decrescente.

  """
  def load_more_posts(last_post_id, limite) do
    Repo.all(from p in Post, where: p.id < ^last_post_id, order_by: [desc: p.id], limit: ^limite)
  end

  @doc """
  Carrega mais posts de um usuário específico do que os já existentes até um limite especificado, com base no ID do último post.

  ## Parâmetros

  - `last_post_id`: O ID do último post existente.
  - `user_id`: O ID do usuário cujos posts estão sendo buscados.
  - `limite`: O número máximo de posts a serem retornados.

  ## Retorna

  Uma lista de posts do usuário especificado, com o ID menores do que o post com o ID especificado, ordenados por ID em ordem decrescente.

  """
  def load_more_posts_by_user_id(last_post_id, user_id, limite) do
    Repo.all(from p in Post, where: p.id < ^last_post_id and p.user_id == ^user_id, order_by: [desc: p.id], limit: ^limite)
  end

  def inc_like(%Post{id: id}, user_id) do
    {1, [post]} =
    from(p in Post, where: p.id == ^id, select: p)
    |> Repo.update_all(inc: [likes: 1], push: [liked_by: user_id])
    broadcast({:ok, post}, :post_updated)
  end

  def dec_like(%Post{id: id}, user_id) do
    {1, [post]} =
    from(p in Post, where: p.id == ^id, select: p)
    |> Repo.update_all(inc: [likes: -1], pull: [liked_by: user_id])
    broadcast({:ok, post}, :post_updated)
  end


  def subscribe do
    Phoenix.PubSub.subscribe(Auth.PubSub, "posts")
  end

  defp broadcast({:error, _reason} = error, _event), do: error
  defp broadcast({:ok, post}, event) do
    Phoenix.PubSub.broadcast(Auth.PubSub, "posts", {event, post})
    {:ok, post}
  end

  defp get_brazilian_datetime() do
    datetime_br = Timex.shift(Timex.now(), hours: -3)
    {Timex.to_date(datetime_br), DateTime.to_time(datetime_br)}
  end

end
