defmodule Rules do
  def eat_ghost?(power_pellet_active, touching_ghost) do
    pacman_can_eat_ghost(power_pellet_active, touching_ghost)
  end

  defp pacman_can_eat_ghost(true, true), do: true
  defp pacman_can_eat_ghost(_, _), do: false

  def score?(touching_power_pellet, touching_dot) do
    pacman_make_score(touching_power_pellet, touching_dot)
  end

  defp pacman_make_score(false, false), do: false
  defp pacman_make_score(_, _), do: true

  def lose?(power_pellet_active, touching_ghost) do
    pacman_died(power_pellet_active, touching_ghost)
  end

  defp pacman_died(false, true), do: true
  defp pacman_died(_, _), do: false

  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) do
    is_dead = pacman_died(power_pellet_active, touching_ghost)
    pacman_win(has_eaten_all_dots, is_dead)
  end

  defp pacman_win(true, false), do: true
  defp pacman_win(_, _), do: false
end
