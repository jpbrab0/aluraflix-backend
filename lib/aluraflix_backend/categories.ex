defmodule AluraflixBackend.Categories do
  alias AluraflixBackend.Categories.Schemas.Category
  alias AluraflixBackend.Videos.Schemas.Video
  alias AluraflixBackend.Repo

  import Ecto.Query

  def get_category(category_id) do
    try do
      Repo.get!(Category, category_id)
    rescue
      Ecto.NoResultsError ->
        {:error, "Non found result for this category id."}
    end
  end

  def get_categories() do
    Repo.all(Category)
  end

  def create_category(params) do
    params
    |> Category.changeset()
    |> Repo.insert()
  end

  def edit_category(id, params) do
    category = get_category(id)

    updated_category =
      category
      |> Category.changeset(params)
      |> Repo.update!()

    case updated_category do
      {:ok, result} -> {:ok, result}

      _ ->
        {:error, "Ocurred an error on edit the category"}
    end

  end

  def remove_category(id) do
    category = get_category(id)

    category
    |> Repo.delete!()

    {:ok, "The category has been deleted."}
  end

  def get_all_videos_of_a_category(id) do
    total_count_category_videos = Repo.one(from v in Video, select: count(v.category_id == ^id))

    query = from(v in Video, where: v.id == ^id, select: v)
    all_videos_of_the_category = Repo.all(query)

    %{total_videos: total_count_category_videos, videos: [all_videos_of_the_category]}
  end
end
