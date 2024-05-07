defmodule AuthWeb.RolePlug do
  import Plug.Conn
  alias Phoenix.Controller

  def init(config), do: config

  def call(conn, role) do
    # pega o user da session em vez de pegar do banco novamente
    user = conn.assigns[:current_user]
    conn = put_session(conn, :current_user, user)

    user_roles = Enum.map(user.roles, fn x -> x.role end)
    cond do
      Enum.member?(user_roles, :admin) ->
        conn
      Enum.member?(user_roles, role) ->
        conn
      true ->
        conn
          |> Controller.put_flash(:error, "Não autorizado")
          |> Controller.redirect(to: "/")
          |> halt()
    end
    conn
  end

end
