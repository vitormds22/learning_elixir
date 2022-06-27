defmodule BlogContextWeb.PageControllerTest do
  use BlogContextWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Vitor!"
  end
end
