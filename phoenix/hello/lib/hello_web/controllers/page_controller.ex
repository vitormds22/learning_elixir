defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug HelloWeb.Plugs.Locale, "en" when action in [:index]

  def home(conn, _params) do
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Let's pretend we have a error")
    |> render("index.html")
  end

  #def redirect_test(conn, _params) do
  # render(conn, "redirect.html")
  #end
end
