defmodule EctoExample.MovieReviews.Schemas.Reviewer do
  use Ecto.Schema

  schema "reviewers" do
    field :name, :string
    timestamps()
  end
end
