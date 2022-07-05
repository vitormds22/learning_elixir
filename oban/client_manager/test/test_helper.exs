Mox.defmock(ClientManager.Ports.BoundAddressMock, for: ClientManager.Ports.BoundAddress)
Application.put_env(:client_manager, :viacep_impl, ClientManager.Ports.BoundAddressMock)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(ClientManager.Repo, :manual)
