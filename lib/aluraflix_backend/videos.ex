defmodule AluraflixBackend.Videos do
  alias AluraflixBackend.Videos.Schemas.Video
  alias AluraflixBackend.Repo

  import Ecto.Query

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

  def search_video_by_name(name_video) do
    like = "%#{name_video}%"
    query = from(v in Video, where: like(v.title, ^like), select: v)

    results = Repo.all(query)

    results
  end

  def get_all_videos_of_a_category(id) do
    id = id |> String.to_integer()
    total_count_category_videos = Repo.one(from v in Video, select: count(v.category_id == ^id))

    query = from(v in Video, where: v.category_id == ^id, select: v)
    all_videos_of_the_category = Repo.all(query)

    %{total_videos: total_count_category_videos, videos: all_videos_of_the_category}
  end
end
