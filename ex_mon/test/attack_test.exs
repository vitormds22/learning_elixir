defmodule ExMon.AttackTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  alias ExMon.{Game, Player}

  describe "attack_opponent/2" do
    test "return a message with player and the damage" do
      messages =
        capture_io(fn ->
          assert Game.Actions.Attack.attack_opponent(:player, :move_avg) == :ok
        end)

      assert messages =~ "The Computer attacked the player"
    end
  end
end
