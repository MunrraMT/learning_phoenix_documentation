defmodule HelloWeb.Plugs.Locale do
  alias Plug.Conn

  @locales ["en", "pt", "fr", "de"]

  def init(default), do: default

  def call(%Conn{params: %{"locale" => loc}} = conn, _default) when loc in @locales do
    Conn.assign(conn, :locale, loc)
  end

  def call(conn, default) do
    Conn.assign(conn, :locale, default)
  end
end
