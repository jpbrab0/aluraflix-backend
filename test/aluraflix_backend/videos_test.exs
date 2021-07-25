defmodule AluraflixBackend.VideosTest do
  use AluraflixBackend.DataCase, async: true

  alias AluraflixBackend.Videos

  describe "get_video/1" do
    test "Get an video by id" do
      # Creating video for later, get this video by id
      {:ok, create_video_result} = Videos.create_video(%{titulo: "lalala teste brabooo", descricao: "teste fodaaaaaaaaaaaaaaaa", url: "https://muitofoda.com.br"})

      get_video_result = Videos.get_video(create_video_result.id)

      assert create_video_result == get_video_result
    end
  end

  describe "create_video/1" do
    test "Create a video" do
      result = Videos.create_video(%{titulo: "lalala teste brabooo", descricao: "teste fodaaaaaaaaaaaaaaaa", url: "https://muitofoda.com.br"})

      assert result != Ecto.QueryError
    end
  end
end
