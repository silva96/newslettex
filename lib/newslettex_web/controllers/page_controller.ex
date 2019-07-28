defmodule NewslettexWeb.PageController do
  use NewslettexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
