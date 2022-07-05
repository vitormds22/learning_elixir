defmodule ClientManager.Ports.BoundAddress do
  alias ClientManager.Ports.AddressResponse

  @callback get_address(binary()) ::
              {:ok, AddressResponse.t()} | {:error, :not_found | :request_failed}

  def get_address(cep) do
    address_impl().get_address(cep)
  end

  defp address_impl() do
    Application.get_env(:client_manager, :address_impl)
  end
end
