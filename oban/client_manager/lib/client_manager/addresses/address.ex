defmodule ClientManager.Addresses.Address do
  use Ecto.Schema
  import Ecto.Changeset

  alias ClientManager.Clients.Client

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @required_key [:cep, :logradouro, :bairro, :localidade, :uf, :client_id]
  @foreign_key_type Ecto.UUID

  schema "addresses" do
    field :bairro, :string
    field :cep, :string
    field :complemento, :string
    field :localidade, :string
    field :logradouro, :string
    field :uf, :string

    belongs_to :client, Client
    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:cep, :logradouro, :complemento, :bairro, :localidade, :uf, :client_id])
    |> validate_required(@required_key)
  end
end
