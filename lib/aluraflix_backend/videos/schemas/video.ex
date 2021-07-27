defmodule AluraflixBackend.Videos.Schemas.Video do
  use Ecto.Schema

  import Ecto.Changeset

  @required [:title, :description, :url]
  @optional []

  schema "videos" do
    field :title, :string
    field :description, :string
    field :url, :string

    timestamps()
  end

  def changeset(model \\ %__MODULE__{}, params) do
    model
    |> cast(params, @required ++ @optional)
    |> validate_required(@required)
    |> validate_format(:url, ~r/https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()!@:%_\+.~#?&\/\/=]*)/)
  end
end
