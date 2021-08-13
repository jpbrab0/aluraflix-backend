defmodule AluraflixBackend.Repo.Migrations.CreateVideosTable do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :title, :string
      add :category_id, :integer
      add :description, :string
      add :url, :string

      timestamps()
    end
  end
end
