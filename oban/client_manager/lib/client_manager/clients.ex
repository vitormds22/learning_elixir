defmodule ClientManager.Clients do
  @moduledoc """
  The Clients context.
  """

  import Ecto.Query, warn: false
  alias ClientManager.Repo
  alias Ecto.Multi

  alias ClientManager.Clients.Client
  alias ClientManager.Addresses.Address
  alias ClientManager.Jobs.AddressJob
  alias ClientManager.FormClientInputs
  alias ClientManager.Viacep.Client, as: Viacep

  @doc """
  Returns the list of clients.

  ## Examples

      iex> list_clients()
      [%Client{}, ...]

  """
  def list_clients do
    Repo.all(Client)
  end

  @doc """
  Gets a single client.

  Raises `Ecto.NoResultsError` if the Client does not exist.

  ## Examples

      iex> get_client!(123)
      %Client{}

      iex> get_client!(456)
      ** (Ecto.NoResultsError)

  """
  def get_client!(id), do: Repo.get!(Client, id)

  @doc """
  Creates a client.

  ## Examples

      iex> create_client(%{field: value})
      {:ok, %Client{}}

      iex> create_client(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_client(attrs \\ %{}) do
    %Client{}
    |> Client.changeset(attrs)
    |> Repo.insert()
  end

  def create_client_with_address(attrs \\ %{}) do
    attrs
    |> FormClientInputs.validate()
    |> case do
      {:ok, input} ->
        client_inputs = Map.take(input, [:name, :age, :occupation])

        multi =
          Multi.new()
          |> Multi.insert(:client, fn _ -> Client.changeset(%Client{}, client_inputs) end)
          |> Multi.run(:job, fn _, %{client: client} ->
            %{cep: input.cep, id: client.id}
            |> AddressJob.new()
            |> Oban.insert()
          end)

        case Repo.transaction(multi) do
          {:ok, %{address: address}} -> {:ok, address}
          {:error, reason} -> {:error, reason}
        end

      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Updates a client.

  ## Examples

      iex> update_client(client, %{field: new_value})
      {:ok, %Client{}}

      iex> update_client(client, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_client(%Client{} = client, attrs) do
    client
    |> Client.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a client.

  ## Examples

      iex> delete_client(client)
      {:ok, %Client{}}

      iex> delete_client(client)
      {:error, %Ecto.Changeset{}}

  """
  def delete_client(%Client{} = client) do
    Repo.delete(client)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking client changes.

  ## Examples

      iex> change_client(client)
      %Ecto.Changeset{data: %Client{}}

  """
  def change_client(%Client{} = client, attrs \\ %{}) do
    Client.changeset(client, attrs)
  end
end
