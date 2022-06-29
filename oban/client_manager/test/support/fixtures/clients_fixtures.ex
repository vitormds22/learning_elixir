defmodule ClientManager.ClientsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClientManager.Clients` context.
  """

  @doc """
  Generate a client.
  """
  def client_fixture(attrs \\ %{}) do
    {:ok, client} =
      attrs
      |> Enum.into(%{
        age: 42,
        name: "some name",
        occupation: "some occupation"
      })
      |> ClientManager.Clients.create_client()

    client
  end
end
