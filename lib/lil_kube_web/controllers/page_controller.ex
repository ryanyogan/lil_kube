defmodule LilKubeWeb.PageController do
  use LilKubeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
