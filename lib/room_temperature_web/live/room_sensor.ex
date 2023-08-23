defmodule RoomTemperatureWeb.RoomSensor do
  import Float

  # Function to simulate reading temperature from sensors (for demonstration purposes)
  def read_temperature do
    # For demonstration purposes, let's simulate the temperature value
    # Replace this with actual code to read temperature from sensors in your real application
    min_temp = 18.0
    max_temp = 20.0
    random_float = :rand.uniform()
    temperature = min_temp + random_float * (max_temp - min_temp)
    round(temperature, 2)
  end
end
