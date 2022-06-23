defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"messenger" => messenger}) do
    conn
    |> assign(:messenger, messenger)
    |> assign(:receiver, "MACHADO")
    |> render("show.html")

    # json(conn, %{id: messenger})
    # text(conn, "From messenger #{messenger}")
  end
end
