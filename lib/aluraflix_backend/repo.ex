defmodule AluraflixBackend.Repo do
  use Ecto.Repo,
    otp_app: :aluraflix_backend,
    adapter: Ecto.Adapters.Postgres
end
