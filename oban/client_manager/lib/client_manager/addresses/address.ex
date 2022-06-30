defmodule ClientManager.Addresses.Address do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @keys [:cep, :logradouro, :complemento, :bairro, :localidade, :uf]

  schema "addresses" do
    field :bairro, :string
    field :cep, :string
    field :complemento, :string
    field :localidade, :string
    field :logradouro, :string
    field :uf, :string
    field :client_id, :id

    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, @keys)
    |> validate_required(@keys)
  end
end
