defmodule AuthWeb.PageController do
  use AuthWeb, :controller
  # import Phoenix.Router.Helpers

    # /
  def index(conn, _params) do
    case AuthWeb.UserAuth.authenticated?(conn) do
    false
      -> redirect(conn, to: Routes.user_session_path(conn, :new))
    true
      -> redirect(conn, to: "/home") # Routes.live_path(conn, AuthWeb.AdminLive, :live_view, [])

    end
  end

end
