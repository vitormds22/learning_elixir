defmodule EctoExample.Hospital.Schemas.Room do
  use Ecto.Schema

  alias EctoExample.Hospital.Schemas.Patient

  schema "rooms" do
    field :floor, :string
    field :number, :string

    belongs_to(:patient, Patient)

    timestamps()
  end
end
