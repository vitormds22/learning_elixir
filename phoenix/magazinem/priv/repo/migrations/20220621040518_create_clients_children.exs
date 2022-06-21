defmodule Magazinem.Repo.Migrations.CreateClientsChildren do
  use Ecto.Migration

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  def change do
    create table(:clients_children) do
      add :client_id, references(:clients, on_delete: :delete_all)
      add :child_id, references(:clients, on_delete: :delete_all)

      timestamps()
    end

    create index(:clients_children, [:client_id])
    create index(:clients_children, [:child_id])
  end
end
