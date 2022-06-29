defmodule TeacherWeb.PageController do
  use TeacherWeb, :controller

  alias Teacher.Workers.ProcessorWorker

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, params) do
    Teacher.Processor.process
    changeset = Teacher.Teacher.changeset(params)

    if changeset.valid? do
      changeset.changes
      |> ProcessorWorker.new()
      |> Oban.insert()

      conn
      |> put_flash(:info, "Work completed!")
      |> redirect(to: Routes.page_path(conn, :show, Ecto.UUID.generate()))
      |> halt()
    else
      conn
      |> render("index.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    conn
    |> render("show.html", teacher: %{id: id, name: "Vitor", age: 25})
  end
end
