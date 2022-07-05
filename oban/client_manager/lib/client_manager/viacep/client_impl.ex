defmodule ClientManager.Viacep.ClientImpl do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://viacep.com.br/"
  plug Tesla.Middleware.JSON

  @behaviour ClientManager.Ports.BoundAddress

  @impl true
  def get_address(cep) when is_binary(cep) do
    "/ws/#{cep}/json/"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}), do: {:ok, body}
  defp handle_get({:ok, %Tesla.Env{status: 404}}), do: {:error, :not_found}
  defp handle_get({:error, _reason}), do: {:error, :request_failed}
end
