defmodule ClientManager.Repo do
  use Ecto.Repo,
    otp_app: :client_manager,
    adapter: Ecto.Adapters.Postgres
end
