defmodule ClientManager.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :age, :integer
      add :occupation, :string

      timestamps()
    end
  end
end
