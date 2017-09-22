defmodule MehrSchulferienWeb.SchoolControllerTest do
  use MehrSchulferienWeb.ConnCase

  alias MehrSchulferien.Location

  @create_attrs %{city: "some city", email: "some email", fax: "some fax", homepage: "some homepage", line1: "some line1", line2: "some line2", name: "some name", phone: "some phone", slug: "some slug", street: "some street", zip_code: "some zip_code"}
  @update_attrs %{city: "some updated city", email: "some updated email", fax: "some updated fax", homepage: "some updated homepage", line1: "some updated line1", line2: "some updated line2", name: "some updated name", phone: "some updated phone", slug: "some updated slug", street: "some updated street", zip_code: "some updated zip_code"}
  @invalid_attrs %{city: nil, email: nil, fax: nil, homepage: nil, line1: nil, line2: nil, name: nil, phone: nil, slug: nil, street: nil, zip_code: nil}

  def fixture(:school) do
    {:ok, school} = Location.create_school(@create_attrs)
    school
  end

  describe "index" do
    test "lists all schools", %{conn: conn} do
      conn = get conn, school_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Schools"
    end
  end

  describe "new school" do
    test "renders form", %{conn: conn} do
      conn = get conn, school_path(conn, :new)
      assert html_response(conn, 200) =~ "New School"
    end
  end

  describe "create school" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, school_path(conn, :create), school: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == school_path(conn, :show, id)

      conn = get conn, school_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show School"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, school_path(conn, :create), school: @invalid_attrs
      assert html_response(conn, 200) =~ "New School"
    end
  end

  describe "edit school" do
    setup [:create_school]

    test "renders form for editing chosen school", %{conn: conn, school: school} do
      conn = get conn, school_path(conn, :edit, school)
      assert html_response(conn, 200) =~ "Edit School"
    end
  end

  describe "update school" do
    setup [:create_school]

    test "redirects when data is valid", %{conn: conn, school: school} do
      conn = put conn, school_path(conn, :update, school), school: @update_attrs
      assert redirected_to(conn) == school_path(conn, :show, school)

      conn = get conn, school_path(conn, :show, school)
      assert html_response(conn, 200) =~ "some updated city"
    end

    test "renders errors when data is invalid", %{conn: conn, school: school} do
      conn = put conn, school_path(conn, :update, school), school: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit School"
    end
  end

  describe "delete school" do
    setup [:create_school]

    test "deletes chosen school", %{conn: conn, school: school} do
      conn = delete conn, school_path(conn, :delete, school)
      assert redirected_to(conn) == school_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, school_path(conn, :show, school)
      end
    end
  end

  defp create_school(_) do
    school = fixture(:school)
    {:ok, school: school}
  end
end
