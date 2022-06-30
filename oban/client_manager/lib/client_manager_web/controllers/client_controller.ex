defmodule ClientManagerWeb.ClientController do
  use ClientManagerWeb, :controller

  alias ClientManager.Clients

  def index(conn, _params) do
    clients = Clients.list_clients()
    render(conn, "index.html", clients: clients)
  end

  def create(conn, params) do
    case Clients.create_client_with_address(params) do
      {:ok, clients} ->
        IO.inspect(clients)
        conn
        |> put_flash(:info, "Client created successfully!")
        |> redirect(to: Routes.client_path(conn, :show, clients.client_id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "index.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => client_id}) do
    client = Clients.get_client!(client_id)
    render(conn, "show.html", client: client)
  end
end
