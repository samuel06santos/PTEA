defmodule AuthWeb.UserSessionController do
  use AuthWeb, :controller
  alias Auth.Accounts
  alias AuthWeb.UserAuth

  def new(conn, _params) do
    render(conn, "new.html", error_message: nil)
  end

  # Login
  def create(conn, %{"user" => user_params}) do
    %{"email" => email, "password" => password} = user_params

    if user = Accounts.get_user_by_email_and_password(email, password) do
      UserAuth.log_in_user(conn, user, user_params)
    else
      # In order to prevent user enumeration attacks, don't disclose whether the email is registered.
      render(conn, "new.html", error_message: "E-mail ou senha inválidos.")
    end
  end

  # Logout
  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Desconectado com sucesso.")
    |> UserAuth.log_out_user()
  end
end
