defmodule ExMon.Trainer.CreateTest do
  use ExMon.DataCase

  alias ExMon.{Repo, Trainer}
  alias Trainer.Create

  describe "call/1" do
    test "when all params are valid, creates a trainer" do
      params = %{name: "Vitor", password: "123456"}

      count_before = Repo.aggregate(Trainer, :count)

      response = Create.call(params)
      count_after = Repo.aggregate(Trainer, :count)

      assert {:ok, %Trainer{name: "Vitor"}} = response
      assert count_after > count_before
    end

    test "when there are invalid params, return the error" do
      params = %{password: "123456"}

      response = Create.call(params)

      assert {:error, changeset} = response
      assert errors_on(changeset) == %{name: ["can't be blank"]}
    end
  end
end
