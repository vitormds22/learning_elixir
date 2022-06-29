defmodule ClientManager.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string
      add :age, :integer
      add :occupation, :string

      timestamps()
    end
  end
end
