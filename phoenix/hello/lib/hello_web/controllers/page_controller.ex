defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug HelloWeb.Plugs.Locale, "en" when action in [:index]

  def home(conn, _params) do
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Let's pretend we have a error")
    |> redirect(to: Routes.page_path(conn, :redirect_test))
  end

  def redirect_test(conn, _params) do
   render(conn, "redirect.html", username: "rafaelnunes", class: "phx-title")
  end
end
