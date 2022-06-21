defmodule Magazinem.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  def change do
    create table(:addresses) do
      add :street, :string
      add :number, :integer
      add :zipcode, :string
      add :client_id, references(:clients, on_delete: :delete_all)

      timestamps()
    end

    create index(:addresses, [:client_id])
  end
end
