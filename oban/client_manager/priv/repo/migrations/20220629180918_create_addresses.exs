defmodule ClientManager.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :cep, :string
      add :logradouro, :string
      add :complemento, :string
      add :bairro, :string
      add :localidade, :string
      add :uf, :string

      timestamps()
    end
  end
end
