defmodule Teacher.AddressesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Teacher.Addresses` context.
  """

  @doc """
  Generate a address.
  """
  def address_fixture(attrs \\ %{}) do
    {:ok, address} =
      attrs
      |> Enum.into(%{
        bairro: "some bairro",
        cep: "some cep",
        complemento: "some complemento",
        localidade: "some localidade",
        logradouro: "some logradouro",
        uf: "some uf"
      })
      |> Teacher.Addresses.create_address()

    address
  end
end
