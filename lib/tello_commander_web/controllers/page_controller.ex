defmodule TCWeb.PageController do
  use TCWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
