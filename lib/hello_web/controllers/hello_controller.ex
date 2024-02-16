defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def show(conn, %{"messenger" => messenger} = _params) do
    # render(conn, :show, messenger: messenger)
    # text(conn, messenger)
    # json(conn, %{messenger: messenger})

    # conn
    # |> assign(:messenger, messenger)
    # |> assign(:receive, "Maria")
    # |> render(:show)

    render(conn, :show, messenger: messenger, receiver: "Dweezil")
  end
end
