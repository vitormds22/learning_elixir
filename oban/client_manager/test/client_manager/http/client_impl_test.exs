defmodule ClientManager.Http.ClientImplTest do
  use ExUnit.Case

  import Tesla.Mock

  alias ClientManager.Viacep.ClientImpl

  @valid_base_url "https://viacep.com.br/ws/03084000/json/"
  @invalid_base_url "https://viacep.com.br/ws/03084100/json/"
  @failed_base_url "https://viacep.com.br/ws//json/"

  def viacep_body() do
    %{
      "cep" => "03084-000",
      "logradouro" => "Rua Santa Virgínia",
      "complemento" => "",
      "bairro" => "Tatuapé",
      "localidade" => "São Paulo",
      "uf" => "SP",
      "ibge" => "3550308",
      "gia" => "1004",
      "ddd" => "11",
      "siafi" => "7107"
    }
  end

  describe "get_address/1" do
    test "happy path" do
      body = viacep_body()

      mock(fn %{method: :get, url: @valid_base_url} ->
        %Tesla.Env{status: 200, body: body}
      end)

      response = ClientImpl.get_address("03084000")

      expected_response = {:ok, body}

      assert response == expected_response
    end

    test "not found path" do
      mock(fn %{method: :get, url: @invalid_base_url} ->
        %Tesla.Env{status: 404}
      end)

      response = ClientImpl.get_address("03084100")

      expected_response = {:error, :not_found}

      assert response == expected_response
    end

    test "request failed path" do
      mock(fn %{method: :get, url: @failed_base_url} ->
        %Tesla.Env{status: 400}
      end)

      response = ClientImpl.get_address("")

      expected_response = {:error, :request_failed}

      assert response == expected_response
    end
  end
end
