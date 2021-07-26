defmodule AluraflixBackendWeb.VideoView do
  use AluraflixBackendWeb, :view

  def render("videos.json", %{videos: videos}) do
    %{videos: render_many(videos, AluraflixBackendWeb.VideoView, "video.json")}
  end

  def render("video.json", %{video: video}) do
    %{
      video: %{
        id: video.id,
        titulo: video.titulo,
        descricao: video.descricao,
        url: video.url
      }
    }
  end
end
