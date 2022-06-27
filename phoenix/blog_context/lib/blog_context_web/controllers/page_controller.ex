defmodule BlogContextWeb.PageController do
  use BlogContextWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
