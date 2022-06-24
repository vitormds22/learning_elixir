defmodule AuthenticatorWeb.PageControllerTest do
  use AuthenticatorWeb.ConnCase

  setup do
    attach_telemetry([:phoenix, :router_dispatch, :stop])
  end

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
    assert_received {
      [:phoenix, :router_dispatch, :stop],
      %{},
      %{conn: %{status: :not_found}}
    }
  end

  defp send_telemetry_data(event_name, measurements, metadata, destination) do
    send(destination, {event_name, measurements, metadata})
  end

  def attach_telemetry(event_name) do
    name = Ecto.UUID.generate()

    :ok =
      :telemetry.attach(
        name,
        event_name,
        &send_telemetry_data/4,
        self()
      )

    ExUnit.Callbacks.on_exit(fn ->
      :telemetry.detach(name)
    end)
  end
end
