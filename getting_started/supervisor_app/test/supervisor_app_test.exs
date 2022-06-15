defmodule SupervisorAppTest do
  use ExUnit.Case
  doctest SupervisorApp

  test "greets the world" do
    assert SupervisorApp.hello() == :world
  end
end
