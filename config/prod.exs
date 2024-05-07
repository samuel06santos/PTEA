import Config

config :auth, AuthWeb.Endpoint,
   cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info
