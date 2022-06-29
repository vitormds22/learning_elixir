defmodule Teacher.AddressesTest do
  use Teacher.DataCase

  alias Teacher.Addresses

  describe "addresses" do
    alias Teacher.Addresses.Address

    import Teacher.AddressesFixtures

    @invalid_attrs %{bairro: nil, cep: nil, complemento: nil, localidade: nil, logradouro: nil, uf: nil}

    test "list_addresses/0 returns all addresses" do
      address = address_fixture()
      assert Addresses.list_addresses() == [address]
    end

    test "get_address!/1 returns the address with given id" do
      address = address_fixture()
      assert Addresses.get_address!(address.id) == address
    end

    test "create_address/1 with valid data creates a address" do
      valid_attrs = %{bairro: "some bairro", cep: "some cep", complemento: "some complemento", localidade: "some localidade", logradouro: "some logradouro", uf: "some uf"}

      assert {:ok, %Address{} = address} = Addresses.create_address(valid_attrs)
      assert address.bairro == "some bairro"
      assert address.cep == "some cep"
      assert address.complemento == "some complemento"
      assert address.localidade == "some localidade"
      assert address.logradouro == "some logradouro"
      assert address.uf == "some uf"
    end

    test "create_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Addresses.create_address(@invalid_attrs)
    end

    test "update_address/2 with valid data updates the address" do
      address = address_fixture()
      update_attrs = %{bairro: "some updated bairro", cep: "some updated cep", complemento: "some updated complemento", localidade: "some updated localidade", logradouro: "some updated logradouro", uf: "some updated uf"}

      assert {:ok, %Address{} = address} = Addresses.update_address(address, update_attrs)
      assert address.bairro == "some updated bairro"
      assert address.cep == "some updated cep"
      assert address.complemento == "some updated complemento"
      assert address.localidade == "some updated localidade"
      assert address.logradouro == "some updated logradouro"
      assert address.uf == "some updated uf"
    end

    test "update_address/2 with invalid data returns error changeset" do
      address = address_fixture()
      assert {:error, %Ecto.Changeset{}} = Addresses.update_address(address, @invalid_attrs)
      assert address == Addresses.get_address!(address.id)
    end

    test "delete_address/1 deletes the address" do
      address = address_fixture()
      assert {:ok, %Address{}} = Addresses.delete_address(address)
      assert_raise Ecto.NoResultsError, fn -> Addresses.get_address!(address.id) end
    end

    test "change_address/1 returns a address changeset" do
      address = address_fixture()
      assert %Ecto.Changeset{} = Addresses.change_address(address)
    end
  end
end