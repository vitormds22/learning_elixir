defmodule SigilsTest do
  use ExUnit.Case
  doctest Sigils

  test "greets the world" do
    assert Sigils.hello() == :world
  end
end
