defmodule EctoExample.Hospital.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table("rooms") do
      add :floor, :string
      add :number, :string
      add :patient_id, references("patients")
      timestamps()
    end
  end
end
