defmodule ClientManagerWeb.ClientController do
  use ClientManagerWeb, :controller

  alias ClientManager.Clients

  def index(conn, _params) do
    clients = Clients.list_clients()
    render(conn, "index.html", clients: clients)
  end

  def create(conn, params) do
    IO.inspect(params, label: "AQUIIIIIIII CLIENT CHANGESET")

    case Clients.create_client(params) do
      {:ok, clients} ->
        conn
        |> put_flash(:info, "Client created successfully!")
        |> redirect(to: Routes.client_path(conn, :show, clients))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "index.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    client = Clients.get_client!(id)
    render(conn, "show.html", client: client)
  end
end
