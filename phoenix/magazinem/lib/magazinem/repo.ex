defmodule Magazinem.Repo do
  use Ecto.Repo,
    otp_app: :magazinem,
    adapter: Ecto.Adapters.Postgres
end
