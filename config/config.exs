# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :chatter_api,
  ecto_repos: [ChatterApi.Repo]

# Configures the endpoint
config :chatter_api, ChatterApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9KpH95Rk3EC/jf0V6r/v4V7eq6/7z6LC21Dn1gmppHGnmGbE7ug2ne8NLb6nFwwD",
  render_errors: [view: ChatterApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: ChatterApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure MIME type application/vnd.api+json
config :phoenix, :format_encoders,
  "json-api": Poison

config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}

# Config Guardian - Elixir authentication
config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT, # optional
  issuer: "ChatterApi",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: System.get_env("GUARDIAN_SECRET") || "Hx0INzCEVWQkhPll+/cn4hOk61GjxtrWTztKlWyl40ybpmeJgYm5oQIYoO9QGKaw",
  serializer: Peepchat.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
