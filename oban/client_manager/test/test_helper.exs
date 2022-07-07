Mox.defmock(ClientManager.Ports.BoundAddressMock, for: ClientManager.Ports.BoundAddress)
Mox.defmock(TeslaMock, for: Tesla.Adapter)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(ClientManager.Repo, :manual)
