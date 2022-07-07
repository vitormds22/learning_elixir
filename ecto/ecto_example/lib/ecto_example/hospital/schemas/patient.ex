defmodule EctoExample.Hospital.Schemas.Patient do
  use Ecto.Schema

  alias EctoExample.Hospital.Schemas.Room

  schema "patients" do
    field :first_name, :string
    field :last_name, :string

    has_one(:room, Room)

    timestamps()
  end
end
