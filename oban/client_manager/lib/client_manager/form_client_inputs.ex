defmodule ClientManager.FormClientInputs do
  use Ecto.Schema
  import Ecto.Changeset

  @keys [:name, :age, :occupation, :cep]

  embedded_schema do
    field :name, :string
    field :age, :integer
    field :occupation, :string
    field :cep, :string
  end

  def changeset(module \\ %__MODULE__{}, params) do
    module
    |> cast(params, [:name, :age, :occupation, :cep])
    |> validate_required(@keys)
  end

  def validate(changeset) do
    changeset
    |> changeset()
    |> apply_action(:validate)
  end
end
