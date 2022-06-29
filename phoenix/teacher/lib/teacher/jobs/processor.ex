defmodule Teacher.Processor do
  alias Teacher.Addresses
  use Oban.Worker,
    queue: :get_cep,
    max_attempts: 5


  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"cep" => cep}}) do
    url = "https://viacep.com.br/ws/#{cep}/json/"
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Addresses.create_address(body)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
        {:ok, :not_found}
      {:error, %HTTPoison.Error{reason: reason} = error} ->
        IO.inspect reason
        {:error, error}
    end
  end
end
