defmodule AluraflixBackend.Repo.Migrations.CreateVideosTable do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :titulo, :string
      add :descricao, :string
      add :url, :string

      timestamps()
    end
  end
end
