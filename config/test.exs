import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :tello_commander, TC.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "tello_commander_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tello_commander, TCWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "LyEv4mZyFErAkePe3BG3bCoy5LCfSDJF2GzqbdgiEpQ+c30pTsJ2Ro5iOTtrZURQ",
  server: false

# In test we don't send emails.
config :tello_commander, TC.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
