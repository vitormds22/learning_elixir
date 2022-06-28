defmodule Magazinem.Magazine.Client do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "clients" do
    field :email, :string
    field :age, :integer
    field :name, :string
    field :phone, :string
    field :sex, :string
    field :size_clothes, Ecto.Enum, values: ~w(pp p m g gg exg g1 g2 g3 g4 g5)a
    field :size_shoes, :integer

    timestamps()
  end

  @required_keys [:name, :age, :email, :sex]
  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :age, :email, :phone, :sex, :size_clothes, :size_shoes])
    |> validate_required(@required_keys)
    |> validate_inclusion(:size_shoes, 33..45)
  end
end
