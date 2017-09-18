defmodule ChatterApi.Router do
  use ChatterApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ChatterApi do
    pipe_through :api
  end
end
