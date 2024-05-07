import Config

config :auth, AuthWeb.Endpoint, server: true

if config_env() == :prod do
  database_url =
    System.get_env("DATABASE_URL") ||
      raise """
      environment variable DATABASE_URL is missing.
      For example: ecto://USER:PASS@HOST/DATABASE
      """

  maybe_ipv6 = if System.get_env("ECTO_IPV6"), do: [:inet6], else: []

  config :auth, Auth.Repo,
    # ssl: true,
    url: database_url,
    pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
    socket_options: maybe_ipv6

  secret_key_base =
    System.get_env("SECRET_KEY_BASE") ||
      raise """
      environment variable SECRET_KEY_BASE is missing.
      You can generate one by calling: mix phx.gen.secret
      """

  host = System.get_env("PHX_HOST")
  port = String.to_integer(System.get_env("PORT") || "8080")

  config :auth, AuthWeb.Endpoint,
    url: [host: host, scheme: "https"],
    http: [
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: port
    ],
    secret_key_base: secret_key_base


  # AWS Connection
  config :ex_aws,
         json_codec: Jason,
         access_key_id: {:system, "AWS_ACCESS_KEY_ID"} || System.get_env("AWS_ACCESS_KEY_ID"),
         secret_access_key: {:system, "AWS_SECRET_ACCESS_KEY"} || System.get_env("AWS_SECRET_ACCESS_KEY"),
         region: {:system, "AWS_REGION"} || System.get_env("AWS_REGION")


  # Configuring the mailer
  config :auth, Auth.Mailer,
         adapter: Swoosh.Adapters.SMTP,
         relay: "smtp.gmail.com",
         port: 587,
         username: {:system, "SMTP_USERNAME"} || System.get_env("SMTP_USERNAME"),
         password: {:system, "SMTP_PASSWORD"} || System.get_env("SMTP_PASSWORD"),
         tls: :always, # can be `:always` or `:never`
         ssl: false, # can be `true`
         retries: 1,
         no_mx_lookups: false, # can be `true`
         auth: :always # can be `:always`. If your smtp relay requires authentication set it to `:always`.

end
