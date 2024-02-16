defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug :put_view, html: HelloWeb.PageHTML, json: HelloWeb.PageJSON

  def index(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    # render(conn, :home, layout: false)

    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(201, "")
  end
end
