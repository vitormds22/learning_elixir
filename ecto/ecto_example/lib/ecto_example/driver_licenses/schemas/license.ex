defmodule EctoExample.DriverLicenses.Schemas.License do
  use Ecto.Schema

  alias EctoExample.DriverLicenses.Schemas.Driver

  schema "licenses" do
    field :type, :string
    field :digits, :string

    belongs_to(:drivers, Driver)

    timestamps()
  end
end
