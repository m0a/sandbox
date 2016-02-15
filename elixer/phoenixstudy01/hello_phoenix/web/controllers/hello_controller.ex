defmodule HelloPhoenix.HelloController do
  use HelloPhoenix.Web, :controller

  def index(conn, params) do
    render conn, "index.html"
  end
  
  def show(conn, %{"messenger" => messenger}) do
    render conn, "show.html", messenger: messenger
  end
  
  def show(conn, %{"messengeraa" => messenger}) do
    render conn, "show.html", messenger: messenger
  end
end
