defmodule ClientManager.Viacep.Client do
  alias ClientManager.Addresses

  def get_address(cep, client_id) do
    url = "https://viacep.com.br/ws/#{cep}/json/"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body_decode = Jason.decode!(body)

        # IO.inspect(body_decode, label: "BODY DO REQUEST::::::::::")

        Addresses.create_address(body_decode, client_id)

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Not found :(")
        {:ok, :not_found}

      {:error, %HTTPoison.Error{reason: reason} = error} ->
        IO.inspect(reason)
        {:error, error}
    end
  end
end
