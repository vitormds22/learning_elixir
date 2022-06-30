defmodule ClientManager.FormClientInputs do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :name, :string
    field :age, :integer
    field :occupation, :string
    field :cep, :string
  end

  def changeset(module \\ %__MODULE__{}, params) do
    module
    |> cast(params, [:name, :age])
    |> validate_required([:name])
    |> validate_number(:age, min: 30)
  end
end
