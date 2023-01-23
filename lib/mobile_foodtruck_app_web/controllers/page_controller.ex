defmodule MobileFoodtruckAppWeb.PageController do
  use MobileFoodtruckAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
