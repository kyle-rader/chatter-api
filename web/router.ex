defmodule ChatterApi.Router do
  use ChatterApi.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", ChatterApi do
    pipe_through :api

    # Route stuff to our SessionController
    resources "/session", SessionController, only: [:index]
  end
end
