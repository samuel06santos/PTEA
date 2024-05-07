defmodule Auth.Accounts.UserNotifier do
  import Swoosh.Email
  alias Auth.Mailer

  # @smtp_username System.get_env("SMTP_USERNAME")

  # Delivers the email using the application mailer.
  defp deliver(recipient, subject, body) do
    email =
      new()
      |> to(recipient)
      |> from({"PTEA", System.get_env("SMTP_USERNAME")})
      |> subject(subject)
      |> text_body(body)

    with {:ok, _metadata} <- Mailer.deliver(email) do
      {:ok, email}
    end
  end

  @doc """
  Deliver instructions to confirm account.
  """
  def deliver_confirmation_instructions(user, url) do
    deliver(user.email, "Instruções de confirmação", """

    ==============================

    Olá #{user.email},
    Você pode confirmar sua conta visitando o URL abaixo:

    #{url}

    Se você não criou uma conta conosco, por favor ignore este e-mail.

    ==============================
    """)
  end

  @doc """
  Deliver instructions to reset a user password.
  """
  def deliver_reset_password_instructions(user, url) do
    deliver(user.email, "Instruções de redefinição de senha", """

    ==============================

    Olá #{user.email},

    Você pode redefinir sua senha visitando o URL abaixo:

    #{url}

    Se você não solicitou essa alteração, ignore este e-mail.

    ==============================
    """)
  end

  @doc """
  Deliver instructions to update a user email.
  """
  def deliver_update_email_instructions(user, url) do
    deliver(user.email, "Atualizar instruções de e-mail", """

    ==============================

    Olá #{user.email},

    Você pode alterar seu e-mail visitando o URL abaixo:

    #{url}

    Se você não solicitou essa alteração, ignore este e-mail.

    ==============================
    """)
  end
end
