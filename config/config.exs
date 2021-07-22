# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :aluraflix_backend,
  ecto_repos: [AluraflixBackend.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :aluraflix_backend, AluraflixBackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ySaS8bFxhs6zETtbEQ60pZ5UMIfgNRlnefBfMumso5Mw/jI+HM7s40bIGCbaL89K",
  render_errors: [view: AluraflixBackendWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: AluraflixBackend.PubSub,
  live_view: [signing_salt: "hy0GF6+K"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
