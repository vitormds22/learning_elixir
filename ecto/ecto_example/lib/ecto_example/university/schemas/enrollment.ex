defmodule EctoExample.University.Schemas.Enrollment do
  use Ecto.Schema

  import Ecto.Changeset

  alias EctoExample.University.Schemas.College
  alias EctoExample.University.Schemas.Student

  schema "enrollments" do
    field :course, :string
    field :accepted, :boolean
    field(:applied_at, :naive_datetime_usec)
    field(:accepted_at, :naive_datetime_usec)
    field(:rejected_at, :naive_datetime_usec)

    belongs_to(:college, College)
    belongs_to(:student, Student)

    timestamps
  end

  def creation_changeset(application, params) do
    application
    |> cast(params, [:course, :applied_at, :college_id, :student_id])
    |> validate_required([:course, :applied_at, :college_id, :student_id])
    |> foreign_key_constraint(:college_id)
    |> foreign_key_constraint(:student_id)
  end

  def acceptance_changeset(application, params) do
    application
    |> cast(params, [:accepted, :accepted_at, :rejected_at])
    |> validate_required([:accepted])
  end
end
