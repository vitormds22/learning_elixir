defmodule TeacherWeb.AddressController do
  use TeacherWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, params) do
    changeset = Teacher.Teacher.changeset(params)


    %{cep: Map.fetch!(params, "cep")}
    |> Teacher.Processor.new()
    |> Oban.insert()
    
  end

  def show(conn, %{"id" => id} = params) do
    conn
    |> render("show.html", teacher: %{id: id, name: "Vitor", age: 25})
  end
end
