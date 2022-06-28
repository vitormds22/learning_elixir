defmodule Magazinem.Repo.Migrations.CreateClients do
  use Ecto.Migration


  def change do
    create table(:clients, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :age, :integer
      add :email, :string
      add :phone, :string
      add :size_clothes, :string
      add :size_shoes, :integer
      add :sex, :string

      timestamps()
    end
  end
end
