defmodule AluraflixBackend.VideosTest do
  use AluraflixBackend.DataCase, async: true

  alias AluraflixBackend.Videos

  describe "get_video/1" do
    test "Get an video by id" do
      # Creating video for later, get this video by id
      {:ok, create_video_result} =
        Videos.create_video(%{
          title: "teste",
          category_id: 1,
          description: "teste description",
          url: "https://teste.com.br"
        })

      get_video_result = Videos.get_video(create_video_result.id)

      assert create_video_result == get_video_result
    end
  end

  describe "create_video/1" do
    test "Create a video" do
      {:ok, result} =
        Videos.create_video(%{
          title: "teste",
          category_id: 1,
          description: "teste description",
          url: "https://teste.com.br"
        })

      assert %{
               title: result.title,
               category_id: result.category_id,
               description: result.description,
               url: result.url
             } == %{
               title: "teste",
               category_id: 1,
               description: "teste description",
               url: "https://teste.com.br"
             }
    end
  end

  # Depois eu termino os testes valeu falou

  # describe "edit_video/2" do
  #   test "Create a video and edit him" do
  #     {:ok, video} =
  #       Videos.create_video(%{
  #         title: "teste",
  #         category_id: 1,
  #         description: "teste description",
  #         url: "https://teste.com.br"
  #       })

  #     {:ok, video_edited} =
  #       Videos.edit_video(video.id, %{
  #         title: "teste editado",
  #         category_id: 1,
  #         description: "descrição atualizada",
  #         url: "https://atualizada.com.br"
  #       })

  #     assert video_edited == %{
  #              title: "teste editado",
  #              category_id: 1,
  #              description: "descrição atualizada",
  #              url: "https://atualizada.com.br"
  #            }
  #   end
  # end
end
