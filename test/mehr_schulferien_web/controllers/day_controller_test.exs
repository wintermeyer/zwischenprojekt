defmodule MehrSchulferienWeb.DayControllerTest do
  use MehrSchulferienWeb.ConnCase

  alias MehrSchulferien.Calendar

  @create_attrs %{day_of_the_year: 42, value: 42, weekday: 42, weekday_de: "some weekday_de"}
  @update_attrs %{day_of_the_year: 43, value: 43, weekday: 43, weekday_de: "some updated weekday_de"}
  @invalid_attrs %{day_of_the_year: nil, value: nil, weekday: nil, weekday_de: nil}

  def fixture(:day) do
    {:ok, day} = Calendar.create_day(@create_attrs)
    day
  end

  describe "index" do
    test "lists all days", %{conn: conn} do
      conn = get conn, day_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Days"
    end
  end

  describe "new day" do
    test "renders form", %{conn: conn} do
      conn = get conn, day_path(conn, :new)
      assert html_response(conn, 200) =~ "New Day"
    end
  end

  describe "create day" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, day_path(conn, :create), day: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == day_path(conn, :show, id)

      conn = get conn, day_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Day"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, day_path(conn, :create), day: @invalid_attrs
      assert html_response(conn, 200) =~ "New Day"
    end
  end

  describe "edit day" do
    setup [:create_day]

    test "renders form for editing chosen day", %{conn: conn, day: day} do
      conn = get conn, day_path(conn, :edit, day)
      assert html_response(conn, 200) =~ "Edit Day"
    end
  end

  describe "update day" do
    setup [:create_day]

    test "redirects when data is valid", %{conn: conn, day: day} do
      conn = put conn, day_path(conn, :update, day), day: @update_attrs
      assert redirected_to(conn) == day_path(conn, :show, day)

      conn = get conn, day_path(conn, :show, day)
      assert html_response(conn, 200) =~ "some updated weekday_de"
    end

    test "renders errors when data is invalid", %{conn: conn, day: day} do
      conn = put conn, day_path(conn, :update, day), day: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Day"
    end
  end

  describe "delete day" do
    setup [:create_day]

    test "deletes chosen day", %{conn: conn, day: day} do
      conn = delete conn, day_path(conn, :delete, day)
      assert redirected_to(conn) == day_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, day_path(conn, :show, day)
      end
    end
  end

  defp create_day(_) do
    day = fixture(:day)
    {:ok, day: day}
  end
end
