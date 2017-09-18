use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :chatter_api, ChatterApi.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :chatter_api, ChatterApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "chatter_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

  config :guardian, Guardian,
    secret_key: "ys1JHd+reat5nRpGTPqYmwAPuQxRHodn2z9lep1iaWlrzOovbkgwi8M/1lZzxQkw"
