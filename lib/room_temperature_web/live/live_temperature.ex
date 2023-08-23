defmodule RoomTemperatureWeb.LiveTemperature do
  use Phoenix.LiveView
  import Float

  def render(assigns) do
    ~H"""
    Current Room Temperature: <%= @temperature %> degrees Celsius
    """
  end

  def mount(_params, _session, socket) do
    schedule_update(socket)
    {:ok, assign(socket, :temperature, RoomTemperatureWeb.RoomSensor.read_temperature())}
  end

  defp schedule_update(socket) do
    Process.send_after(self(), :update_temperature, 5000)
  end

  def handle_info(:update_temperature, socket) do
    temperature = RoomTemperatureWeb.RoomSensor.read_temperature()
    {:noreply, assign(socket, :temperature, temperature)}
  end
end
