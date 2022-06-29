defmodule TeacherWeb.PageController do
  use TeacherWeb, :controller

  def index(conn, _params) do
    changeset = Teacher.Teacher.changeset(%{})

    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, params) do
    changeset = Teacher.Teacher.changeset(params)

    %{cep: Map.fetch!(params, "cep")}
    |> Teacher.Processor.new()
    |> Oban.insert()

    if changeset.valid? do
      conn
      |> put_flash(:info, "Work completed!")
      |> redirect(to: Routes.page_path(conn, :show, Ecto.UUID.generate()))
      |> halt()
    else
      conn
      |> render("index.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id} = params) do
    conn
    |> render("show.html", teacher: %{id: id, name: "Vitor", age: 25})
  end
end
