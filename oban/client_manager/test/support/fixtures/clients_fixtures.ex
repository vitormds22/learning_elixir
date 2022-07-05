defmodule ClientManager.ClientsFixtures do
  alias ClientManager.Clients.Client
  alias ClientManager.Repo

  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClientManager.Clients` context.
  """

  @doc """
  Generate a client.
  """
  def client_fixture(attrs \\ %{}) do
    params =
      attrs
      |> Enum.into(%{
        age: 42,
        name: "some name",
        occupation: "some occupation"
      })

    %Client{}
    |> Client.changeset(params)
    |> Repo.insert!()
  end
end
