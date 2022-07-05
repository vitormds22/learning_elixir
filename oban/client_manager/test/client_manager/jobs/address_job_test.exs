defmodule ClientManager.Jobs.AddressJobTest do
  use ClientManager.DataCase
  use Oban.Testing, repo: ClientManager.Repo

  doctest ClientManager.Jobs.AddressJob
  alias ClientManager.Jobs.AddressJob
  alias ClientManager.Repo

  alias ClientManager.Addresses.Address

  alias ClientManager.ClientsFixtures

  alias ClientManager.Ports.AddressResponse

  def address_response() do
    %AddressResponse{
      bairro: "Tatuapé",
      cep: "03084-000",
      complemento: "",
      localidade: "São Paulo",
      logradouro: "Rua Santa Virgínia",
      uf: "SP"
    }
  end

  defmodule Faker do
    @behaviour ClientManager.Ports.BoundAddress
    alias ClientManager.Jobs.AddressJobTest

    def get_address("03084-000") do
      {:ok, AddressJobTest.address_response()}
    end

    def get_address("111") do
      {:error, :not_found}
    end

    def get_address("222") do
      {:error, :request_failed}
    end
  end

  setup do
    Application.put_env(:client_manager, :address_impl, Faker)
  end

  describe "perform/1" do
    test "happy path using faker" do
      client =
        ClientsFixtures.client_fixture(%{name: "Vitor TESTE", age: 25, occupation: "TESTE OBAN"})

      response = address_response()

      assert {:ok, address} = perform_job(AddressJob, %{"cep" => response.cep, "id" => client.id})
      address = Repo.one(Address)

      assert address.bairro == response.bairro
      assert is_nil(address.complemento)
      assert address.localidade == response.localidade
      assert address.logradouro == response.logradouro
      assert address.uf == response.uf
      assert address.cep == response.cep
      assert address.client_id == client.id
    end

    test "fail path" do
      assert {:error, :not_found} = perform_job(AddressJob, %{"cep" => "111", "id" => "1"})
    end

    test "request failed path" do
      assert {:error, :request_failed} = perform_job(AddressJob, %{"cep" => "222", "id" => "2"})
    end
  end
end
