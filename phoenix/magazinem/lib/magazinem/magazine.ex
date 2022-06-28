defmodule Magazinem.Magazine do
  import Ecto.Query, warn: false
  alias Magazinem.Repo
  alias Magazinem.Magazine.Client
  alias Magazinem.Magazine.ClientChild
  alias Magazinem.Magazine.Address

  def list_clients do
    Repo.all(Client)
  end

  def get_client!(id), do: Repo.get!(Client, id)

  def create_client(params \\ %{}) do
    IO.inspect(params, label: "Dados do cliente")
    %Client{}
    |> Client.changeset(params)
    |> Repo.insert()
  end

  def update_client(%Client{} = client, params) do
    client
    |> Client.changeset(params)
    |> Repo.update()
  end

  def delete_client(%Client{} = client) do
    Repo.delete(client)
  end

  def change_post(%Client{} = client, params \\ %{}) do
    Client.changeset(client, params)
  end
end
