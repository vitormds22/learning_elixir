defmodule Protocols do
  def type(value) when is_binary(value), do: "string"
  def type(value) when is_integer(value), do: "integer"
end
