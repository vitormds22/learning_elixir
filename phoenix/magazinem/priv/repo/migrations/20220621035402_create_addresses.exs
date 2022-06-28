defmodule Magazinem.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :street, :string
      add :number, :integer
      add :zipcode, :string
      add :client_id, references(:clients, type: :uuid, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:addresses, [:client_id])
  end
end
