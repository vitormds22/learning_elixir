defmodule PhoenixSocket.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_socket,
    adapter: Ecto.Adapters.Postgres
end
