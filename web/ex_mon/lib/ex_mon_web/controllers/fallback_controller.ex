defmodule ExMonWeb.FallbackController do
  use ExMonWeb, :controller

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(ExMonWeb.ErrorView)
    |> render("401.json", result: "Trainer unauhtorized")
  end

  def call(conn, {:error, result}) do
    conn
    |> put_status(:not_found)
    |> put_view(ExMonWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
