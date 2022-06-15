defmodule FizzbuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valide file provided, returns a converted list" do
      expected_response = {:ok, [1, 2, :fizz, 4, :buzz, :buzz, :fizzbuzz, :buzz]}
      assert Fizzbuzz.build("numbers.txt") == expected_response
    end

    test "when an invalide file provided, returns an error" do
      expected_response = {:error, "Error reading the file: enoent"}
      assert Fizzbuzz.build("invalid.txt") == expected_response
    end
  end
end
