defmodule Magazinem.Repo.Migrations.CreateClientsChildren do
  use Ecto.Migration

  def change do
    create table(:clients_children, primary_key: false) do
      add :client_id, references(:clients, type: :uuid, on_delete: :delete_all), null: false
      add :child_id, references(:clients, type: :uuid, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:clients_children, [:client_id])
    create index(:clients_children, [:child_id])
  end
end
