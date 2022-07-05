import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :client_manager, ClientManager.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "client_manager_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :client_manager, Oban,
  testing: :inline,
  queues: false,
  plugins: false

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :client_manager, ClientManagerWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "W6DdNPfMIORfj/KwUdwmNBmlblvjDthSpMNVauVExULYjJJss4VXdnOdUyZyX5l2",
  server: false

# In test we don't send emails.
config :client_manager, ClientManager.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
