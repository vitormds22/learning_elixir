defmodule MovieManagerTest do
  use ExUnit.Case
  doctest MovieManager

  test "greets the world" do
    assert MovieManager.hello() == :world
  end
end
