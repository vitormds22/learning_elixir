defmodule Magazinem.Client do
  @doc~S"""

  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "clients" do
    field :email, :string
    field :name, :string
    field :phone, :string
    field :sex, :string
    field :size_clothes, Ecto.Enum, values: ~w(pp p m g gg exg g1 g2 g3 g4 g5)a
    field :size_shoes, :integer

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :email, :phone, :size_clothes, :size_shoes, :sex])
    |> validate_required([:name, :email, :phone, :size_clothes, :size_shoes, :sex])
  end
end
