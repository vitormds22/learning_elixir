defmodule Magazinem.Magazine.Address do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "addresses" do
    field :number, :integer
    field :street, :string
    field :zipcode, :string
    field :client_id, :id

    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:street, :number, :zipcode])
    |> validate_required([:street, :number, :zipcode])
  end
end
