defmodule AuthWeb.UserSettingsController do
  use AuthWeb, :controller

  alias Auth.{Accounts, Repo}
  alias AuthWeb.{UserAuth, ImageController}

  plug :assign_email_and_password_changesets

  def edit(conn, _params) do
    render(conn, "edit.html")
  end

  def edit_profile(conn, _params) do
    render(conn, "edit_profile.html")
  end

  # falta validar os regex dos links
  def update_profile(conn, %{"action" => "update_account"} = params) do
    %{"user" => user_attrs, "current_password" => current_password} = params
#    insta_re = ~r{^(?:https://)?(?:(?:www\.)?instagram\.com)?/?[\w.-]+/?$}
#    facebook_re = ~r{^(https://)?((www\.)?facebook\.com)?/?[\w.-]+/?$}
#    linkedin_re = ~r{^(https://)?((www\.)?linkedin\.com/in/)?/?[\w.-]+/?$}

    # adiciona o @ na frente do username
#    user_attrs = %{user_attrs | "username" => "@#{user_attrs.username}"}
    user = conn.assigns.current_user
    user_attrs = user_attrs |> Map.put("password", current_password)

    dbg params #

    # Se tiver alguma imagem no input file
    user_attrs = if user_attrs["file_input"] do
      # Vai fazer o upload da imagem p/ o S3
      username = String.slice(user.username, 1..-1//1) # Vai remover o `@` do início
      filename_path = ImageController.upload_profile_image(user_attrs["file_input"], username)
      user_attrs |> Map.put("profile_img_path", filename_path)
    end

    changeset =
      Accounts.User.registration_changeset(user, user_attrs, hash_password: false)

    case Accounts.User.valid_password?(user, current_password) do
      true ->
        Repo.insert_or_update(changeset)
        conn
        |> put_flash(:info, "Mudanças alteradas.")
        |> redirect(to: Routes.user_settings_path(conn, :edit_profile))

      false ->
#        {_, changeset} = changeset |> Ecto.Changeset.apply_action(:update)
        conn
        |> put_flash(:error, "Senha incorreta")
        |> render("edit_profile.html") #, account_changeset: changeset
        # nao consegui retornar os valores do changeset
    end
  end

  def update(conn, %{"action" => "update_email"} = params) do
    %{"current_password" => password, "user" => user_params} = params
    user = conn.assigns.current_user

    case Accounts.apply_user_email(user, password, user_params) do
      {:ok, applied_user} ->
        Accounts.deliver_update_email_instructions(
          applied_user,
          user.email,
          &Routes.user_settings_url(conn, :confirm_email, &1)
        )

        conn
        |> put_flash(
          :info,
          "Um link para confirmar a alteração do seu e-mail foi enviado para o novo endereço."
        )
        |> redirect(to: Routes.user_settings_path(conn, :edit))

      {:error, changeset} ->
        render(conn, "edit.html", email_changeset: changeset)
    end
  end

  def update(conn, %{"action" => "update_password"} = params) do
    %{"current_password" => password, "user" => user_params} = params
    user = conn.assigns.current_user

    case Accounts.update_user_password(user, password, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Senha atualizada com sucesso.")
        |> put_session(:user_return_to, Routes.user_settings_path(conn, :edit))
        |> UserAuth.log_in_user(user)

      {:error, changeset} ->
        render(conn, "edit.html", password_changeset: changeset)
    end
  end

  def confirm_email(conn, %{"token" => token}) do
    case Accounts.update_user_email(conn.assigns.current_user, token) do
      :ok ->
        conn
        |> put_flash(:info, "Email trocado com sucesso.")
        |> redirect(to: Routes.user_settings_path(conn, :edit))

      :error ->
        conn
        |> put_flash(:error, "O link de alteração de e-mail é inválido ou expirou.")
        |> redirect(to: Routes.user_settings_path(conn, :edit))
    end
  end

  defp assign_email_and_password_changesets(conn, _opts) do
    user = conn.assigns.current_user

    conn
    |> assign(:email_changeset, Accounts.change_user_email(user))
    |> assign(:password_changeset, Accounts.change_user_password(user))
    |> assign(:account_changeset, Accounts.change_user_registration(user))#
  end
end
