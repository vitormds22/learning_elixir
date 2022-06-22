defmodule HelloWeb.PageJsonController do
  use HelloWeb, :controller

  def show(conn, %{"messenger" => messenger}) do
    page = %{title: messenger}

    render(conn, "show.json", page: page)
  end

  def index(conn, _params) do
    pages = [%{title: "foo"}, %{title: "bar"}]

    render(conn, "index.json", pages: pages)
  end
end
