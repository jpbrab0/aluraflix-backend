defmodule AluraflixBackendWeb.CategoryController do
  use AluraflixBackendWeb, :controller

  alias AluraflixBackend.Categories

  def get_categories_by_id(conn, %{"id" => id}) do
    case Categories.get_category(id) do
      {:error, reason} ->
        conn
        |> put_status(:not_found)
        |> json(%{message: reason})

      category_data -> render(conn, "category.json", category: category_data)
    end
  end

  def get_all_categories(conn, _) do
    categories = Categories.get_categories()
    case categories do
      Ecto.NoResultsError ->
        conn
        |> put_status(:not_found)
        |> json(%{message: "No category registered"})

      _ ->
        render(conn, "categories.json", categories: categories)
    end
  end

  def create_new_category(conn, params) do
    case Categories.create_category(params) do
      {:ok, category_data} -> render(conn, "category.json", category: category_data)

      {:error, _reason} ->
        put_status(conn, :not_found)
        json(conn, %{message: "An error ocurred on the database query"})
    end
  end

  def update_category_by_id(conn, params) do
    id = params["id"] |> String.to_integer()

    params = params |> Map.drop(["id"])

    case Categories.edit_category(id, params) do
      {:ok, updated_category_data} -> render(conn, "category.json", category: updated_category_data)

      {:error, reason} ->
        conn
        |> put_status(:not_found)
        |> json(%{message: reason})
    end
  end

  def delete_category_by_id(conn, %{"id" => id}) do
    {:ok, message} = Categories.remove_category(id)

    conn
    |> put_status(:ok)
    |> json(%{message: message})
  end
end
