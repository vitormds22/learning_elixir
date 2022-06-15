defmodule Lasagna do
  @max_minutes 40
  @minutes_per_layer 2
  def expected_minutes_in_oven() do
    @max_minutes
  end
  def remaining_minutes_in_oven(actual_minutes) do
    expected_minutes_in_oven() - actual_minutes
  end
  def preparation_time_in_minutes(layers) do
    layers * @minutes_per_layer
  end
  def total_time_in_minutes(layers, minutes_in_oven) do
    preparation_time_in_minutes(layers) + minutes_in_oven
  end
  def alarm() do
    "Ding!"
  end
end
