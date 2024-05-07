defmodule Auth.Accounts.Role do
  use Ecto.Schema
  @timestamps_opts [type: :utc_datetime]
  import Ecto.Changeset
  alias Auth.Accounts.User

  schema "roles" do
    belongs_to :user, User
    field :role, Ecto.Enum, values: [:admin, :normal]
    field :deleted, :integer, default: -1

    timestamps()
  end

  @doc false
  def changeset(schema, attrs) do
    schema
      |> cast(attrs, [:user_id, :role, :deleted])
      |> validate_required([:user_id, :role])
      |> foreign_key_constraint(:user_id)
      |> unique_constraint(:user_id, name: :role_user)
  end
end
