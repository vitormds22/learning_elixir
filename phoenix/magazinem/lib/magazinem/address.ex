defmodule Magazinem.Address do
  use Ecto.Schema
  import Ecto.Changeset

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
