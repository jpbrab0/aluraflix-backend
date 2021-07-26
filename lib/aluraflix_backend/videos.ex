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

  def get_videos() do
    Repo.all(Video)
  end

  def create_video(params) do
    params
    |> Video.changeset()
    |> Repo.insert()
  end

  def edit_video(id, params) do
    video = get_video(id)

    updated_video =
      video
      |> Video.changeset(params)
      |> Repo.update!()

    case updated_video do
      {:ok, result} -> {:ok, result}

      _ ->
        {:error, "Ocurred an error on edit the video"}
    end

  end

  def remove_video(id) do
    video = get_video(id)

    video
    |> Repo.delete!()

    {:ok, "The video has been deleted."}
  end
end
