defmodule AluraflixBackendWeb.VideoController do
  use AluraflixBackendWeb, :controller

  alias AluraflixBackend.Videos

  def get_video_by_id(conn, %{"id" => id}) do
    case Videos.get_video(id) do
      {:error, reason} ->
        conn
        |> put_status(:not_found)
        |> json(%{message: reason})

      video_data -> render(conn, "video.json", video: video_data)
    end
  end

  def get_all_videos(conn, _) do
    render(conn, "videos.json", videos: Videos.get_videos())
  end

  def create_new_video(conn, params) do
    case Videos.create_video(params) do
      {:ok, video_data} -> render(conn, "created_video.json", video: video_data)

      {:error, _reason} ->
        put_status(conn, :not_found)
        json(conn, %{message: "An error ocurred on the database query"})
    end
  end
end
