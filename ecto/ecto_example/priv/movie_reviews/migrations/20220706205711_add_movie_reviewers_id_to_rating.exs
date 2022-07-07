defmodule EctoExample.MovieReviews.Repo.Migrations.AddMovieReviewersIdToRating do
  use Ecto.Migration

  def change do
    alter table("ratings") do
      add(:movie_id, references("movies"))
      add(:reviewer_id, references("reviewers"))
    end
  end
end
