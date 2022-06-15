defmodule Concat do
  #def join(a, b \\ nil, sep \\ " ")

  #def join(a, b, _sep) when is_nil(b) do
   # a
  # end

  def join(a, b) do
    IO.puts("***First Join")
    a <> b
  end

  def join(a, b, sep \\ " ") do
    IO.puts("***SEcond Join")
    a <> sep <> b
  end
end
