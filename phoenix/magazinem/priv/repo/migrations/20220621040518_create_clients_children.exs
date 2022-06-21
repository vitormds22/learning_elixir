defmodule Magazinem.Repo.Migrations.CreateClientsChildren do
  use Ecto.Migration

  def change do
    create table(:clients_children) do
      add :client_id, references(:clients, on_delete: :cascade)
      add :child_id, references(:clients, on_delete: :cascade)

      timestamps()
    end

    create index(:clients_children, [:client_id])
    create index(:clients_children, [:child_id])
  end
end
