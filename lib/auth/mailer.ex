defmodule Auth.Mailer do
  use Swoosh.Mailer, otp_app: :auth
  import Swoosh.Email
end
