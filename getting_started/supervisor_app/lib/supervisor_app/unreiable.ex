defmodule SupervisorApp.Unreliable do
  use GenServer
  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  @spec init(:ok) :: {:ok, []}
  def init(:ok) do
    run_process()
    {:ok, []}
  end

  def handle_info(:run, state) do
    IO.inspect state
    run_process()

    num = [1,2,3,"four"]
    |> Enum.random()
    |> Kernel.+(0)

    {:noreply, [num | state]}
  end
  defp run_process do
    Process.send_after(self(), :run, 2000)
  end
end
