defmodule ClientManager.Mox.MoxAddressJobTest do
  use ClientManager.DataCase
  use Oban.Testing, repo: ClientManager.Repo
  import Mox

  doctest ClientManager.Jobs.AddressJob

  alias ClientManager.Jobs.AddressJob
  alias ClientManager.Repo
  alias ClientManager.Addresses.Address
  alias ClientManager.ClientsFixtures
  alias ClientManager.Ports.AddressResponse
  alias ClientManager.Ports.BoundAddress
  alias ClientManager.Ports.BoundAddressMock

  setup :verify_on_exit!

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

  describe "get_address/1" do
    test "happy path using mox" do
      client =
        ClientsFixtures.client_fixture(%{name: "Vitor TESTE", age: 25, occupation: "TESTE OBAN"})

      response = address_response()

      expect(BoundAddressMock, :get_address, fn cep ->
        assert cep == response.cep

        {:ok, response}
      end)

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

    test "fail path using mox" do
      expect(BoundAddressMock, :get_address, fn cep ->
        assert cep == "111"

        {:error, :not_found}
      end)

      assert {:error, :not_found} = perform_job(AddressJob, %{"cep" => "111", "id" => "1"})
    end

    test "request_failed path using mox" do
      expect(BoundAddressMock, :get_address, fn cep ->
        assert cep == "222"

        {:error, :request_failed}
      end)

      assert {:error, :request_failed} = perform_job(AddressJob, %{"cep" => "222", "id" => "2"})
    end
  end
end
