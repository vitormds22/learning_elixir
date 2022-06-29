defmodule ClientManager.Addresses.Address do
  use Ecto.Schema
  import Ecto.Changeset

  schema "addresses" do
    field :bairro, :string
    field :cep, :string
    field :complemento, :string
    field :localidade, :string
    field :logradouro, :string
    field :uf, :string

    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:cep, :logradouro, :complemento, :bairro, :localidade, :uf])
    |> validate_required([:cep, :logradouro, :complemento, :bairro, :localidade, :uf])
  end
end
