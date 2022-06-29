defmodule Teacher.Workers.ProcessorWorker do
  use Oban.Worker

  def perform(%Oban.Job{args: args} = job) do
    IO.puts("Starting work...")
    Teacher.Processor.process
    IO.inspect(args, label: "AQUIIIIIIIIIIIIIIIIII")
    IO.inspect(job, label: "JOOOOOOOB")
    IO.puts("...Finished work!")
  end
end
