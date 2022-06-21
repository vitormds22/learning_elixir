defmodule Magazinem.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string
      add :email, :string
      add :phone, :string
      add :size_clothes, :string
      add :size_shoes, :integer
      add :sex, :string

      timestamps()
    end
  end
end
