defmodule NewslettexWeb.PageControllerTest do
  use NewslettexWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "page"
  end
end
