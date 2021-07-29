defmodule AluraflixBackend.Categories do
  alias AluraflixBackend.Categories.Schemas.Category
  alias AluraflixBackend.Repo

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
end
