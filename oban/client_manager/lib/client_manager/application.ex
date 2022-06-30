defmodule ClientManager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ClientManager.Repo,

      # Oban
      {Oban, Application.fetch_env!(:client_manager, Oban)},

      # Start the Telemetry supervisor
      ClientManagerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ClientManager.PubSub},
      # Start the Endpoint (http/https)
      ClientManagerWeb.Endpoint
      # Start a worker by calling: ClientManager.Worker.start_link(arg)
      # {ClientManager.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ClientManager.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ClientManagerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
