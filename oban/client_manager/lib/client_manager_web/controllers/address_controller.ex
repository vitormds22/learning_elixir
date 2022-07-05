defmodule ClientManagerWeb.AddressController do
  use ClientManagerWeb, :controller

  alias ClientManager.Addresses

  def index(conn, _params) do
    address = Addresses.list_addresses()
    render(conn, "index.html", address: address)
  end

  # def create(conn, params) do
  #   case Addresses.create_address(params) do
  #     {:ok, clients} ->
  #       conn
  #       |> put_flash(:info, "Address created successfully!")
  #       |> redirect(to: Routes.client_path(conn, :index, clients))

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "index.html", changeset: changeset)
  #   end
  # end

  def show(conn, %{"id" => id}) do
    address = Addresses.get_address!(id)
    render(conn, "show.html", address: address)
  end
end
