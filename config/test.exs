import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :mobile_foodtruck_app, MobileFoodtruckApp.Repo,
  username: "postgres",
  password: "DCU!123!hoy",
  hostname: "localhost",
  database: "mobile_foodtruck_app_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10,
  port: 5433

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mobile_foodtruck_app, MobileFoodtruckAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "QvfvgtN0Ri4N7sONOWUXbV7EpKQS0mUHMqkQgUcFmWeMB8Oc7Av/rqbSaA3ICWH/",
  server: false

# In test we don't send emails.
config :mobile_foodtruck_app, MobileFoodtruckApp.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
