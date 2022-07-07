import Config

config :ecto_example,
  ecto_repos: [
    EctoExample.Hospital.Repo,
    EctoExample.DriverLicenses.Repo,
    EctoExample.University.Repo,
    EctoExample.MovieReviews.Repo
  ]

config :ecto_example, EctoExample.MovieReviews.Repo,
  database: "movies_reviews",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  priv: "priv/movie_reviews"

config :ecto_example, EctoExample.University.Repo,
  database: "university_database",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  priv: "priv/university"

config :ecto_example, EctoExample.DriverLicenses.Repo,
  database: "driver_licenses",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  priv: "priv/driver_licenses"

config :ecto_example, EctoExample.Hospital.Repo,
  database: "hospital",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  priv: "priv/hospital"
