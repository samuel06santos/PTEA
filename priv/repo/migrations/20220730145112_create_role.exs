defmodule Auth.Repo.Migrations.CreateRole do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :role, :string
      add :deleted, :integer, default: -1
      timestamps()
    end

    create unique_index(:roles, [:user_id, :role], name: :role_user)
  end
end
