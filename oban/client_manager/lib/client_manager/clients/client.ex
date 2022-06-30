defmodule ClientManager.Clients.Client do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "clients" do
    field :age, :integer
    field :name, :string
    field :occupation, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :age, :occupation])
    |> validate_required([:name, :age, :occupation])
  end
end
