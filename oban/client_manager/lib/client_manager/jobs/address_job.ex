defmodule ClientManager.Jobs.AddressJob do
  use Oban.Worker, queue: :address
  require Logger

  alias ClientManager.Ports.BoundAddress
  alias ClientManager.Addresses

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"cep" => cep, "id" => id}}) do
    with {:ok, values} <- BoundAddress.get_address(cep),
         {:ok, address} <- Addresses.create_address(Map.from_struct(values), id) do
      {:ok, address}
    else
      {:error, reason} ->
        Logger.error("#{__MODULE__}.perform error=#{inspect(reason)}")
        {:error, reason}
    end
  end

  # def perform(%Oban.Job{args: %{"cep" => cep, "id" => id}}) do
  #   case BoundAddress.get_address(cep) do
  #     {:ok, values} ->
  #       case Addresses.create_address(values, id) do
  #         {:ok, address} -> :ok
  #         {:error, reason} -> {:error, reason}
  #       end
  #     {:error, reason} -> {:error, reason}
  #   end
  # end
end
