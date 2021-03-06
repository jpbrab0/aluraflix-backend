defmodule AluraflixBackendWeb.Router do
  use AluraflixBackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AluraflixBackendWeb do
    pipe_through :api

    # Video Routes
    get "/videos/:id", VideoController, :get_video_by_id
    get "/videos", VideoController, :get_all_videos
    post "/videos", VideoController, :create_new_video
    put "/videos/:id", VideoController, :update_video_by_id
    delete "/videos/:id", VideoController, :delete_video_by_id

    # Category Routes
    get "/categories", CategoryController, :get_all_categories
    get "/categories/:id", CategoryController, :get_categories_by_id
    get "/categories/:id/videos/", VideoController, :get_videos_by_category
    post "/categories", CategoryController, :create_new_category
    put "/categories/:id", CategoryController, :update_category_by_id
    delete "/categories/:id", CategoryController, :delete_category_by_id
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: AluraflixBackendWeb.Telemetry
    end
  end
end
