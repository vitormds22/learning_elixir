defmodule BlogContext.Business do
  use Oban.Worker, queue: :events
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