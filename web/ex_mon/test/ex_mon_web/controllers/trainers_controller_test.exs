defmodule ExMonWeb.Controllers.TrainersControllerTest do
  use ExMonWeb.ConnCase

  import ExMonWeb.Auth.Guardian
  alias ExMon.Trainer

  describe "show/2" do
    setup %{conn: conn} do
      params = %{name: "Vitor", password: "123456"}
      {:ok, trainer} = ExMon.create_trainer(params)
      {:ok, token, _claims} = encode_and_sign(trainer)

      conn = put_req_header(conn, "authorization", "Bearer #{token}")
      {:ok, conn: conn}
    end

    test "when there is a trainer with the given id, returns the trainer", %{conn: conn} do
      params = %{name: "Vitor", password: "123456"}

      {:ok, %Trainer{id: id}} = ExMon.create_trainer(params)

      response =
        conn
        |> get(Routes.trainers_path(conn, :show, id))
        |> json_response(:ok)

      assert %{"id" => _id, "inserted_at" => _inserted_at, "name" => "Vitor"} = response
    end

    test "when there is an error, returns the error", %{conn: conn} do
      response =
        conn
        |> get(Routes.trainers_path(conn, :show, "1234"))
        |> json_response(404)

      expected_response = %{"message" => "Invalid ID format"}
      assert response == expected_response
    end
  end

  describe "create/2" do
    test "when create a trainer succefully, returns the trainer created with a message", %{
      conn: conn
    } do
      params = %{name: "Vitor", password: "123456"}

      response =
        conn
        |> post(Routes.trainers_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Trainer created!",
               "trainer" => %{"id" => _id, "inserted_at" => _inserted_at, "name" => "Vitor"}
             } = response
    end

    test "when there is an error with creation of trainer, returns the error", %{conn: conn} do
      params = %{password: "123456"}

      response =
        conn
        |> post(Routes.trainers_path(conn, :create, params))
        |> json_response(404)

      expected_response = %{"message" => %{"name" => ["can't be blank"]}}
      assert response == expected_response
    end

    test "when there is an error with the lenght of passwords, returns the error", %{conn: conn} do
      params = %{name: "Vitor", password: "1234"}

      response =
        conn
        |> post(Routes.trainers_path(conn, :create, params))
        |> json_response(404)

      expected_response = %{"message" => %{"password" => ["should be at least 6 character(s)"]}}
      assert response == expected_response
    end
  end
end
