defmodule AuthWeb.Router do
  use AuthWeb, :router

  import AuthWeb.UserAuth

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {AuthWeb.LayoutView, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(:fetch_current_user)
  end

  # / Main Home
  scope "/", AuthWeb do
    pipe_through(:browser)

    get("/", PageController, :index)

  end

  ## Feed (if logged)
  scope "/", AuthWeb do
    pipe_through([:browser, :require_authenticated_user])

    live("/home", FeedLive, :live_view) # route to feed ( /home or / )
  end

  ## Authentication routes
  scope "/", AuthWeb do
    pipe_through([:browser, :redirect_if_user_is_authenticated])
    get("/users/register", UserRegistrationController, :new) # route to
    post("/users/register", UserRegistrationController, :create) # form
    get("/users/log_in", UserSessionController, :new) # route to
    post("/users/log_in", UserSessionController, :create) # form
    get("/users/reset_password", UserResetPasswordController, :new)
    post("/users/reset_password", UserResetPasswordController, :create)
    get("/users/reset_password/:token", UserResetPasswordController, :edit)
    put("/users/reset_password/:token", UserResetPasswordController, :update)
  end

  # Settings Route
  scope "/", AuthWeb do
    pipe_through([:browser, :require_authenticated_user])

    get("/users/settings", UserSettingsController, :edit) # route to
    put("/users/settings", UserSettingsController, :update) # form
    get("/users/settings/confirm_email/:token", UserSettingsController, :confirm_email)

    get("/users/settings/profile", UserSettingsController, :edit_profile) # route to pagina p/ editar o perfil
    put("/users/settings/profile", UserSettingsController, :update_profile) # form
  end

  # Search Route
  scope "/", AuthWeb do
    pipe_through([:browser, :require_authenticated_user])
    live("/search", SearchLive)
  end

  # User's crud
  scope "/", AuthWeb do
    pipe_through([:browser])
    delete("/users/log_out", UserSessionController, :delete) # log-out
    get("/users/confirm", UserConfirmationController, :new)
    post("/users/confirm", UserConfirmationController, :create)
    get("/users/confirm/:token", UserConfirmationController, :edit)
    post("/users/confirm/:token", UserConfirmationController, :update)
  end

  # Profile Route
  scope "/", AuthWeb do
    pipe_through([:browser, :require_authenticated_user])
    live("/:username", ProfileLive) # route to profile ( /@username )
  end
end
