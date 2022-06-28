defmodule PhoenixSocket.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PhoenixSocket.Repo,
      # Start the Telemetry supervisor
      PhoenixSocketWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixSocket.PubSub},
      # Start the Endpoint (http/https)
      PhoenixSocketWeb.Endpoint,
      # Presence statement
      PhoenixSocketWeb.Presence
      # Start a worker by calling: PhoenixSocket.Worker.start_link(arg)
      # {PhoenixSocket.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixSocket.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixSocketWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end