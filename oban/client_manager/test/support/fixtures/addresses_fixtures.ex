defmodule ClientManager.AddressesFixtures do
  alias ClientManager.Addresses.Address
  alias ClientManager.Repo

  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClientManager.Addresses` context.
  """

  @doc """
  Generate a address.
  """
  def address_fixture(attrs \\ %{}) do
    params =
      attrs
      |> Enum.into(%{
        bairro: "some bairro",
        cep: "some cep",
        complemento: "some complemento",
        localidade: "some localidade",
        logradouro: "some logradouro",
        uf: "some uf"
      })

    %Address{}
    |> Address.changeset(params)
    |> Repo.insert!()
  end
end
