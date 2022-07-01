defmodule ClientManager.Jobs.AddressJob do
  use Oban.Worker, queue: :address

  alias ClientManager.Viacep.Client, as: Viacep
  alias ClientManager.Addresses

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"cep" => cep, "id" => id}}) do
    case Viacep.get_address(cep) do
      {:ok, values} -> Addresses.create_address(values, id)
      {:error, reason} -> {:error, reason}
    end
  end
end
