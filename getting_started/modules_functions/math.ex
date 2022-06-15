defmodule Math do
  @moduledoc """
    Provides math-related functions

    ## Examples
      iex> Math.sum(1,2)
      3
  """

  @doc """
  Calculates the sum of two numbers
  """
  def sum(a,b), do: do_sum(a,b)

  defp do_sum(a, b), do: a + b

  def sub(a,b), do: a - b

  def mult(a, b), do: a * b

  def div(a, b), do: trunc(a / b)

  def zero?(0), do: true
  def zero?(x) when is_integer(x), do: false
  def zero?(x) when not is_integer(x), do: false
end
