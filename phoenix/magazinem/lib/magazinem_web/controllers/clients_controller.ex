defmodule MagazinemWeb.ClientsController do
  use MagazinemWeb, :controller

  alias Magazinem.Magazine
  alias Magazinem.Magazine.Client

  # def index(conn, _params) do
  #   clients = Magazine.list_clients()
  #   render(conn, "index.json", clients: clients)
  # end

  def create(conn, %{"client" => client_params}) do
    case Magazine.create_client(client_params) do
      {:ok, client} ->
        conn
        |> put_flash(:info, "Client created successfully")
        |> render("create.json", clients: client)
      {:error, _changeset} -> :error
    end
  end
end
