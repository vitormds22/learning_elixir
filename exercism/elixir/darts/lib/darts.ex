defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    {x, y}
    |> handle_area()
    |> handle_score()
  end

  defp handle_area({x, y}) do
    distance = :math.sqrt(x * x + y * y)

    cond do
      distance <= 1 -> :inner
      distance <= 5 -> :middle
      distance <= 10 -> :outer
      true -> :outside
    end
  end

  defp handle_score(area) do
    case area do
      :inner -> 10
      :middle -> 5
      :outer -> 1
      :outside -> 0
    end
  end
end
