defmodule BlogContext.Business do
  use Oban.Worker,
    queue: :events,
    priority: 3,
    max_attempts: 3,
    tags: ["business"],
    unique: [period: 30]
    # We can configure the worker to be unique only by worker and queue
    # unique: [fields: [:queue, :worker], period: 30]

    # We can configure the worker to be unique for state
    # unique: [states: [:available, :scheduled, :executing], period: 300]

    # FOR ALL STATES
    # unique: [states: Oban.jobs.states(), period: 300]

    # Only for key => :batatinha
    # unique: [fields: [:args, :worker], keys: [:batatinha]]

  alias BlogContext.Blog

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"id" => id} = args}) do
    model = Blog.get_post!(id)

    case args do
      %{"in_the" => "business"} ->
        IO.inspect(model)
      %{"vote_for" => vote} ->
        IO.inspect([vote, model])
      _ ->
        IO.inspect(model)
    end

    :ok
  end
end
