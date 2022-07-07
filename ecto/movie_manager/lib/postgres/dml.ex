defmodule Postgres.Dml do
  def create_tables() do
    opts = [
      hostname: "localhost",
      username: "postgres",
      password: "postgres",
      database: "postgres",
      port: 5432
    ]

    {:ok, pid} = Postgrex.start_link(opts)
  end
end
