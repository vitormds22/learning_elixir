defmodule EctoExample.DriverLicenses.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  def change do
    create table("drivers") do
      field :first_name, :string
      field :last_name, :string
      timestamps()
    end
  end
end
