defmodule SampleApp.Web.CalculationControllerTest do
  use SampleApp.Web.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "reports 200 for negate request", %{conn: conn} do
    conn = get conn, calculation_path(conn, :show, "negate", "1")
    assert "-1" == response(conn, 200)
  end

  test "reports 200 for square request", %{conn: conn} do
    conn = get conn, calculation_path(conn, :show, "square", "2")
    assert "4" == response(conn, 200)
  end

end
