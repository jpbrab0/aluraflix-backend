defmodule AluraflixBackendWeb.VideoView do
  use AluraflixBackendWeb, :view

  def render("videos.json", %{videos: videos}) do
    %{videos: render_many(videos, AluraflixBackendWeb.VideoView, "video.json")}
  end

  def render("video.json", %{video: video}) do
    %{
      id: video.id,
      title: video.title,
      category_id: video.category_id,
      description: video.description,
      url: video.url
    }
  end

  def render("videosbycategory.json", %{video_data: video_data}) do
    %{
      total: video_data.total_videos,
      videos: render_many(video_data.videos, AluraflixBackendWeb.VideoView, "video.json")
    }
  end
end
