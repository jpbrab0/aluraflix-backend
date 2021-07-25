defmodule AluraflixBackend.Videos do
  alias AluraflixBackend.Videos.Schemas.Video
  alias AluraflixBackend.Repo

  def get_video(video_id) do
    try do
      Repo.get!(Video, video_id)
    rescue
      Ecto.NoResultsError ->
        {:error, "Non found result for this video id."}
    end
  end

  def create_video(params) do
    params
    |> Video.changeset()
    |> Repo.insert()
  end
end
