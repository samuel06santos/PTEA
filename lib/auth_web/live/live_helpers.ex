defmodule AuthWeb.LiveHelpers do
  import Phoenix.LiveView
  alias AuthWeb.Router.Helpers, as: Routes

  def assign_defaults(session, socket) do
    user = session["current_user"]
    IO.puts("ASSIGN DEFAULT")
    IO.inspect(user)
    socket = assign_new(socket, :current_user, fn ->
      user
    end)

    if is_nil(socket.assigns.current_user) do
      socket
        |> put_flash(:error, "É necessário realizar login para acessar essa página")
        |> redirect(to: Routes.user_session_path(socket, :new))
    else
      socket
    end
  end

end
