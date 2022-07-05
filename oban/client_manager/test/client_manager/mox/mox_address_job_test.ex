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
      expect(BoundAddressMock, :get_address, fn args ->
        assert args == address_response()

        {:ok, address_response()}
      end)

      assert {:ok, _} = BoundAddressMock.get_address(address_response())
    end

    test "fail path using mox" do
      expect(BoundAddressMock, :get_address, fn args ->
        assert args == "111"

        {:error, :not_found}
      end)

      assert {:error, :not_found} = BoundAddressMock.get_address("111")
    end

    test "request_failed path using mox" do
      expect(BoundAddressMock, :get_address, fn args ->
        assert args == "222"

        {:error, :request_failed}
      end)

      assert {:error, :request_failed} = BoundAddressMock.get_address("222")
    end
  end
end
