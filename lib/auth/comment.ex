defmodule Auth.Comment do
  import Ecto.Changeset
  import Ecto.Query
  use Ecto.Schema
  use Timex
  alias Auth.{Repo, Post, Comment}
  alias Auth.Accounts.User

  schema "comments" do
    belongs_to :user, User
    belongs_to :post, Post
    field :text, :string
    field :date, :date
    field :time, :time

    timestamps()
  end

  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [
        :user_id,
        :post_id,
        :text,
        :date,
        :time
      ])
    |> validate_required([:user_id, :post_id, :text])
    |> validate_length(:text, min: 1, max: 400)
  end

  def create_comment(attrs) do
    {date, time} = get_brazilian_datetime()
    %__MODULE__{}
    |> changeset(Map.merge(attrs, %{date: date, time: time}))
    |> Repo.insert()
    |> broadcast(:post_created) #comment_created
  end

  def update_comment(comment, attrs) do
    comment
    |> Comment.changeset(attrs)
    |> Repo.update()
    |> broadcast(:comment_created)
  end

  def delete_comment(comment) do
    Repo.delete(comment)
  end

  def list_comments(post_id) do
    Repo.all(from c in Comment, where: c.post_id == ^post_id, order_by: [desc: c.id], preload: [:user])
  end

  def subscribe do
    Phoenix.PubSub.subscribe(Auth.PubSub, "comments")
  end

  defp broadcast({:error, _reasson} = error, _event), do: error
  defp broadcast({:ok, comment}, event) do
    Phoenix.PubSub.broadcast(Auth.PubSub, "comments", {event, comment})
    {:ok, comment}
  end

  defp get_brazilian_datetime() do
    datetime_br = Timex.shift(Timex.now(), hours: -3)
    {Timex.to_date(datetime_br), DateTime.to_time(datetime_br)}
  end

end
