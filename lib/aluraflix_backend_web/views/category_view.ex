defmodule AluraflixBackendWeb.CategoryView do
  use AluraflixBackendWeb, :view

  def render("categories.json", %{categories: categories}) do
    %{videos: render_many(categories, AluraflixBackendWeb.CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    %{
      video: %{
        id: category.id,
        title: category.title,
        color: category.color
      }
    }
  end
end
