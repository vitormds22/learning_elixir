defmodule Magazinem.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :street, :string
      add :number, :integer
      add :zipcode, :string
      add :client_id, references(:clients, on_delete: :cascade)
      many_to_many()

      timestamps()
    end

    create index(:addresses, [:client_id])
  end
end
