defmodule ClientManager.Viacep.Client do
  def get_address(cep) do
    url = "https://viacep.com.br/ws/#{cep}/json/"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Jason.decode(body)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Not found :(")
        {:ok, :not_found}
      {:error, %HTTPoison.Error{reason: reason} = error} ->
        IO.inspect(reason)
        {:error, error}
    end
  end
end
