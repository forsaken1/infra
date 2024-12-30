# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :sessions,
  ecto_repos: [Sessions.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :sessions, SessionsWeb.Endpoint,
  url: [host: "0.0.0.0"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: SessionsWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Sessions.PubSub,
  live_view: [signing_salt: "pP2g/K++"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :kafka_ex,
  brokers: [{"localhost", 9094}],
  consumer_group: "sessions",
  use_ssl: false

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
