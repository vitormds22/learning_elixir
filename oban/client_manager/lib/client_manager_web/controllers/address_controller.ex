defmodule ClientManagerWeb.AddressController do
  use ClientManagerWeb, :controller

  alias ClientManager.Addresses

  def index(conn, _params) do
    address = Addresses.list_addresses()
    render(conn, "index.html", address: address)
  end

  def create(conn, params) do
    IO.inspect(params, label: "AQUIIIIIIII CEEEEEEP CHANGESET")

    case Addresses.create_address(params) do
      {:ok, clients} ->
        conn
        |> put_flash(:info, "Address created successfully!")
        |> redirect(to: Routes.client_path(conn, :index, clients))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "index.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    client = Clients.get_client!(id)
    render(conn, "show.html", client: client)
  end
end
