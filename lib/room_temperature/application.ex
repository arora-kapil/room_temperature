defmodule RoomTemperature.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      RoomTemperatureWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RoomTemperature.PubSub},
      # Start Finch
      {Finch, name: RoomTemperature.Finch},
      # Start the Endpoint (http/https)
      RoomTemperatureWeb.Endpoint
      # Start a worker by calling: RoomTemperature.Worker.start_link(arg)
      # {RoomTemperature.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RoomTemperature.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RoomTemperatureWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
