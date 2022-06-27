defmodule BlogContext.Repo do
  use Ecto.Repo,
    otp_app: :blog_context,
    adapter: Ecto.Adapters.Postgres
end
