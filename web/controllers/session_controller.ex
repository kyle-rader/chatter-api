defmodule ChatterApi.SessionController do
  use ChatterApi.Web, :controller

  def index(conn, _params) do
    # Return some static JSON
    conn
    |> json(%{status: "ok"})
  end
end
