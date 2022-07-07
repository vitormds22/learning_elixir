defmodule EctoExample.MovieReviews.Schemas.Movie do
  use Ecto.Schema

  schema "movies" do
    field :title, :string
    field :director, :string
    field :year, :integer
    timestamps()
  end
end
