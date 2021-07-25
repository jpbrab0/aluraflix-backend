use Mix.Config

config :aluraflix_backend,
  ecto_repos: [AluraflixBackend.Repo]

config :aluraflix_backend, AluraflixBackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ySaS8bFxhs6zETtbEQ60pZ5UMIfgNRlnefBfMumso5Mw/jI+HM7s40bIGCbaL89K",
  render_errors: [view: AluraflixBackendWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: AluraflixBackend.PubSub,
  live_view: [signing_salt: "hy0GF6+K"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
