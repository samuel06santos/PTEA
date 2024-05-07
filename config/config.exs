import Config

config :auth,
  ecto_repos: [Auth.Repo]

# Configures the Repo
config :auth, Auth.Repo,
  migration_timeout: 60_000 # 60 seconds

# Configures the endpoint
config :auth, AuthWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: AuthWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Auth.PubSub,
  live_view: [signing_salt: "C6UeIVxe"]

# Configures the mailer
config :swoosh, :api_client, false

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


# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]
# Tailwind
config :tailwind, version: "3.3.2", default: [
  args: ~w(
    --config=tailwind.config.js
    --input=css/app.css
    --output=../priv/static/assets/app.css
  ),
  cd: Path.expand("../assets", __DIR__)
]


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# AWS Connection
config :ex_aws,
  json_codec: Jason,
  access_key_id: {:system, "AWS_ACCESS_KEY_ID"} || System.get_env("AWS_ACCESS_KEY_ID"),
  secret_access_key: {:system, "AWS_SECRET_ACCESS_KEY"} || System.get_env("AWS_SECRET_ACCESS_KEY"),
  region: {:system, "AWS_REGION"} || System.get_env("AWS_REGION")


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
