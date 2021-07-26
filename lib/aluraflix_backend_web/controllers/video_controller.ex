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
    videos = Videos.get_videos()
    case videos do
      Ecto.NoResultsError ->
        conn
        |> put_status(:not_found)
        |> json(%{message: "No video registered"})

      _ ->
        render(conn, "videos.json", videos: videos)
    end
  end

  def create_new_video(conn, params) do
    case Videos.create_video(params) do
      {:ok, video_data} -> render(conn, "video.json", video: video_data)

      {:error, _reason} ->
        put_status(conn, :not_found)
        json(conn, %{message: "An error ocurred on the database query"})
    end
  end

  def update_video_by_id(conn, params) do
    id = params["id"] |> String.to_integer()

    params = params |> Map.drop(["id"])

    case Videos.edit_video(id, params) do
      {:ok, updated_video_data} -> render(conn, "video.json", video: updated_video_data)

      {:error, reason} ->
        conn
        |> put_status(:not_found)
        |> json(%{message: reason})
    end
  end

  def delete_video_by_id(conn, %{"id" => id}) do
    {:ok, message} = Videos.remove_video(id)

    conn
    |> put_status(:ok)
    |> json(%{message: message})
  end
end
