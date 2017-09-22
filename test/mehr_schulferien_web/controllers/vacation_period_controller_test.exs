defmodule MehrSchulferienWeb.VacationPeriodControllerTest do
  use MehrSchulferienWeb.ConnCase

  alias MehrSchulferien.Calendar

  @create_attrs %{bank_holiday: true, ends_on: ~D[2010-04-17], name: "some name", starts_on: ~D[2010-04-17], weekend: true}
  @update_attrs %{bank_holiday: false, ends_on: ~D[2011-05-18], name: "some updated name", starts_on: ~D[2011-05-18], weekend: false}
  @invalid_attrs %{bank_holiday: nil, ends_on: nil, name: nil, starts_on: nil, weekend: nil}

  def fixture(:vacation_period) do
    {:ok, vacation_period} = Calendar.create_vacation_period(@create_attrs)
    vacation_period
  end

  describe "index" do
    test "lists all vacation_periods", %{conn: conn} do
      conn = get conn, vacation_period_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Vacation periods"
    end
  end

  describe "new vacation_period" do
    test "renders form", %{conn: conn} do
      conn = get conn, vacation_period_path(conn, :new)
      assert html_response(conn, 200) =~ "New Vacation period"
    end
  end

  describe "create vacation_period" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, vacation_period_path(conn, :create), vacation_period: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == vacation_period_path(conn, :show, id)

      conn = get conn, vacation_period_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Vacation period"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, vacation_period_path(conn, :create), vacation_period: @invalid_attrs
      assert html_response(conn, 200) =~ "New Vacation period"
    end
  end

  describe "edit vacation_period" do
    setup [:create_vacation_period]

    test "renders form for editing chosen vacation_period", %{conn: conn, vacation_period: vacation_period} do
      conn = get conn, vacation_period_path(conn, :edit, vacation_period)
      assert html_response(conn, 200) =~ "Edit Vacation period"
    end
  end

  describe "update vacation_period" do
    setup [:create_vacation_period]

    test "redirects when data is valid", %{conn: conn, vacation_period: vacation_period} do
      conn = put conn, vacation_period_path(conn, :update, vacation_period), vacation_period: @update_attrs
      assert redirected_to(conn) == vacation_period_path(conn, :show, vacation_period)

      conn = get conn, vacation_period_path(conn, :show, vacation_period)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, vacation_period: vacation_period} do
      conn = put conn, vacation_period_path(conn, :update, vacation_period), vacation_period: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Vacation period"
    end
  end

  describe "delete vacation_period" do
    setup [:create_vacation_period]

    test "deletes chosen vacation_period", %{conn: conn, vacation_period: vacation_period} do
      conn = delete conn, vacation_period_path(conn, :delete, vacation_period)
      assert redirected_to(conn) == vacation_period_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, vacation_period_path(conn, :show, vacation_period)
      end
    end
  end

  defp create_vacation_period(_) do
    vacation_period = fixture(:vacation_period)
    {:ok, vacation_period: vacation_period}
  end
end
