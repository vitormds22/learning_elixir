defmodule AuthenticatorWeb.Telemetry do
  use Supervisor
  import Telemetry.Metrics

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  @impl true
  def init(_arg) do
    children = [
      # Telemetry poller will execute the given period measurements
      # every 10_000ms. Learn more here: https://hexdocs.pm/telemetry_metrics
      {:telemetry_poller, measurements: periodic_measurements(), period: 10_000}
      # Add reporters as children of your supervision tree.
      # {Telemetry.Metrics.ConsoleReporter, metrics: metrics()}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  def metrics do
    [
      # Phoenix Metrics
      summary("phoenix.endpoint.stop.duration",
        unit: {:native, :millisecond}
      ),
      summary("phoenix.router_dispatch.stop.duration",
        tags: [:route],
        tag_values: &get_and_put_http_method/1,
        unit: {:native, :millisecond}
      ),
      summary("phoenix.live_view.mount.stop.duration",
        unit: {:native, :millisecond},
        tags: [:view, :connected?],
        tag_values: &live_view_metric_tag_values/1
      ),

      # Database Metrics
      summary("authenticator.repo.query.total_time",
        unit: {:native, :millisecond},
        description: "The sum of the other measurements"
      ),
      summary("authenticator.repo.query.decode_time",
        unit: {:native, :millisecond},
        description: "The time spent decoding the data received from the database"
      ),
      summary("authenticator.repo.query.query_time",
        unit: {:native, :millisecond},
        description: "The time spent executing the query"
      ),
      summary("authenticator.repo.query.queue_time",
        unit: {:native, :millisecond},
        description: "The time spent waiting for a database connection"
      ),
      summary("authenticator.repo.query.idle_time",
        unit: {:native, :millisecond},
        description:
          "The time the connection spent waiting before being checked out for the query"
      ),

      # VM Metrics
      summary("vm.memory.total", unit: {:byte, :kilobyte}),
      summary("vm.total_run_queue_lengths.total"),
      summary("vm.total_run_queue_lengths.cpu"),
      summary("vm.total_run_queue_lengths.io"),

      last_value("authenticator.users.total"),
      last_value("authenticator.auth_server.memory", unit: :byte),
      last_value("authenticator.auth_server.message_queue_len"),
      summary("authenticator.auth_server.call.stop.duration"),
      counter("authenticator.auth_server.call.exception")
    ]
  end

  defp get_and_put_http_method(%{conn: %{method: method}} = metadata) do
    Map.put(metadata, :method, method)
  end

  defp live_view_metric_tag_values(metadata) do
    metadata
    |> Map.put(:view, inspect(metadata.socket.view))
    |> Map.put(:connected?, get_connection_status(metadata.socket))
  end

  defp get_connection_status(%{connected?: true}), do: "Connected"
  defp get_connection_status(%{connected?: false}), do: "Disconnected"

  defp periodic_measurements do
    [
      {Authenticator, :measure_users, []},
      {:process_info,
        event: [:authenticator, :auth_server],
        name: Authenticator.AuthServer,
        keys: [:message_queue_len, :memory]}
    ]
  end
end
