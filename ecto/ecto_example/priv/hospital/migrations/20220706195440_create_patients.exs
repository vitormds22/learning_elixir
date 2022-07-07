defmodule EctoExample.Hospital.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    add :first_name, :string
    add :last_name, :string
    timestamps()
  end
end
