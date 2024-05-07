import Config

# Configure your database
config :auth, Auth.Repo,
  username: System.get_env("DATABASE_USER") || "postgres",
  password: System.get_env("DATABASE_PASSWORD") || "postgres",
  hostname: "localhost" || System.get_env("DATABASE_HOST"),
  database: System.get_env("DATABASE_NAME") || "postgres",
  port: 15432 || String.to_integer(System.get_env("DATABASE_PORT")),
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10,
  timeout: 120_000 # 120 seconds

config :auth, AuthWeb.Endpoint,
  # Binding to loopback ipv4 address prevents access from other machines.
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  # http: [ip: {127, 0, 0, 1}, ...],
  http: [ip: {0, 0, 0, 0}, port: 80],
  check_origin: false,
  code_reloader: true,
  debug_errors: true, # false
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  secret_key_base: "RzCDBrCvehFqcZCi9IsQaNmrXtuMTVoKmh93JSD5Jy/um9/ejzl7qP+DbfywQfVJ",
  render_errors: [view: AuthWeb.ErrorView, accepts: ~w(html json)],
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]}
  ]

# Watch static and templates for browser reloading.
config :auth, AuthWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/auth_web/(live|views)/.*(ex)$",
      ~r"lib/auth_web/templates/.*(eex)$"
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
