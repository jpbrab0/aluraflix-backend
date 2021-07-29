defmodule AluraflixBackend.Categories.Schemas.Category do
  use Ecto.Schema

  import Ecto.Changeset

  alias AluraflixBackend.Videos.Schemas.Video

  @required [:title, :color]
  @optional []

  schema "categories" do
    field :title, :string
    field :color, :string

    belongs_to :video, Video

    timestamps()
  end

  def changeset(model \\ %__MODULE__{}, params) do
    model
    |> cast(params, @required ++ @optional)
    |> validate_required(@required)
  end
end
