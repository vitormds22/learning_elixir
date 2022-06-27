defmodule PhoenixSocketWeb.RoomChannel do
  use Phoenix.Channel
  alias PhoenixSocketWeb.Presence
  alias PhoenixSocket.Accounts

  intercept ["user_joined"]

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("room:" <> private_room_id, params, socket) do
    IO.inspect(params)
    if Map.get(params, "token") == "senha" and private_room_id == "1" do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def join("room:lobby", %{"name" => name}, socket) do
    # IO.inspect(socket, label: "SOCKET AQUIIII!")
    send(self(), :after_join)
    {:ok, assign(socket, :name, name)}
  end
  def handle_info(:after_join, socket) do
    {:ok, _} =
      Presence.track(socket, socket.assigns.name, %{
        online_at: inspect(System.system_time(:second))
      })

    push(socket, "presence_state", Presence.list(socket))
    {:noreply, socket}
  end
  def handle_in("new_msg", %{"body" => body}, socket) do
    IO.puts("#{inspect(body)}")
    broadcast!(socket, "new_msg", %{body: body})
    {:noreply, socket}
  end

  def handle_out("user_joined", msg, socket) do
    if Accounts.ignoring_user?(socket.assigns[:user], msg.user_id) do
      {:noreply, socket}
    else
      push(socket, "user_joined", msg)
      {:noreply, socket}
    end
  end
end
