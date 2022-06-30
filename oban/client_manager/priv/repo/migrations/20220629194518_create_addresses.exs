defmodule ClientManager.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :cep, :string
      add :logradouro, :string
      add :complemento, :string
      add :bairro, :string
      add :localidade, :string
      add :uf, :string
      add :client_id, references(:clients, type: :uuid, on_delete: :delete_all), null: false

      timestamps()
    end
  end
end
