defmodule MobileFoodtruckApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      MobileFoodtruckApp.Repo,
      # Start the Telemetry supervisor
      MobileFoodtruckAppWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MobileFoodtruckApp.PubSub},
      # Start the Endpoint (http/https)
      MobileFoodtruckAppWeb.Endpoint
      # Start a worker by calling: MobileFoodtruckApp.Worker.start_link(arg)
      # {MobileFoodtruckApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MobileFoodtruckApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MobileFoodtruckAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
