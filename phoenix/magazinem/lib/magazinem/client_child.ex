defmodule Magazinem.ClientChild do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients_children" do

    field :client_id, :id
    field :child_id, :id

    timestamps()
  end

  @doc false
  def changeset(client_child, attrs) do
    client_child
    |> cast(attrs, [])
    |> validate_required([])
  end
end
