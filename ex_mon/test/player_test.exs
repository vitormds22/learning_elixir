defmodule ExMon.PlayerTest do
  use ExUnit.Case
  alias ExMon.{Player,Game}

  describe "build/4" do
    test "return a map with player data" do
      player = Player.build("Vitor", :chute, :cura, :soco)
      computer = Player.build("Robotinik", :chute, :cura, :soco)

      Game.start(computer, player)

      expected_response = %Player{
        life: 100,
        moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
        name: "Vitor"
      }

      assert expected_response == Player.build("Vitor", :chute, :cura, :soco)
    end
  end
end
