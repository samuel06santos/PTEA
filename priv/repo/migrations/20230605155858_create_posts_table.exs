defmodule Auth.Repo.Migrations.CreatePostsTable do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :text, :text
      add :date, :date
      add :time, :time
      add :likes, :integer
      add :liked_by, {:array, :integer}
      add :photo_url, :string
      timestamps()
    end
  end

  def down do
    drop table(:posts)
  end
end
