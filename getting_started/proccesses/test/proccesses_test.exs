defmodule ProccessesTest do
  use ExUnit.Case
  doctest Proccesses

  test "greets the world" do
    assert Proccesses.hello() == :world
  end
end
