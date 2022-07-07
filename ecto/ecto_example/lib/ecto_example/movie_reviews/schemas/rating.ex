defmodule EctoExample.MovieReviews.Schemas.Rating do
  use Ecto.Schema

  alias EctoExample.MovieReviews.Schemas.Movie
  alias EctoExample.MovieReviews.Schemas.Reviewer

  schema "ratings" do
    field :stars, :integer

    belongs_to(:movies, Movie)
    belongs_to(:reviewers, Reviewer)
    timestamps()
  end
end
