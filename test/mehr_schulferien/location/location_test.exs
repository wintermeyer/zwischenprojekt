defmodule MehrSchulferien.LocationTest do
  use MehrSchulferien.DataCase

  alias MehrSchulferien.Location

  describe "countries" do
    alias MehrSchulferien.Location.Country

    @valid_attrs %{name: "some name", slug: "some slug"}
    @update_attrs %{name: "some updated name", slug: "some updated slug"}
    @invalid_attrs %{name: nil, slug: nil}

    def country_fixture(attrs \\ %{}) do
      {:ok, country} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Location.create_country()

      country
    end

    test "list_countries/0 returns all countries" do
      country = country_fixture()
      assert Location.list_countries() == [country]
    end

    test "get_country!/1 returns the country with given id" do
      country = country_fixture()
      assert Location.get_country!(country.id) == country
    end

    test "create_country/1 with valid data creates a country" do
      assert {:ok, %Country{} = country} = Location.create_country(@valid_attrs)
      assert country.name == "some name"
      assert country.slug == "some slug"
    end

    test "create_country/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Location.create_country(@invalid_attrs)
    end

    test "update_country/2 with valid data updates the country" do
      country = country_fixture()
      assert {:ok, country} = Location.update_country(country, @update_attrs)
      assert %Country{} = country
      assert country.name == "some updated name"
      assert country.slug == "some updated slug"
    end

    test "update_country/2 with invalid data returns error changeset" do
      country = country_fixture()
      assert {:error, %Ecto.Changeset{}} = Location.update_country(country, @invalid_attrs)
      assert country == Location.get_country!(country.id)
    end

    test "delete_country/1 deletes the country" do
      country = country_fixture()
      assert {:ok, %Country{}} = Location.delete_country(country)
      assert_raise Ecto.NoResultsError, fn -> Location.get_country!(country.id) end
    end

    test "change_country/1 returns a country changeset" do
      country = country_fixture()
      assert %Ecto.Changeset{} = Location.change_country(country)
    end
  end

  describe "federal_states" do
    alias MehrSchulferien.Location.FederalState

    @valid_attrs %{name: "some name", slug: "some slug"}
    @update_attrs %{name: "some updated name", slug: "some updated slug"}
    @invalid_attrs %{name: nil, slug: nil}

    def federal_state_fixture(attrs \\ %{}) do
      {:ok, federal_state} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Location.create_federal_state()

      federal_state
    end

    test "list_federal_states/0 returns all federal_states" do
      federal_state = federal_state_fixture()
      assert Location.list_federal_states() == [federal_state]
    end

    test "get_federal_state!/1 returns the federal_state with given id" do
      federal_state = federal_state_fixture()
      assert Location.get_federal_state!(federal_state.id) == federal_state
    end

    test "create_federal_state/1 with valid data creates a federal_state" do
      assert {:ok, %FederalState{} = federal_state} = Location.create_federal_state(@valid_attrs)
      assert federal_state.name == "some name"
      assert federal_state.slug == "some slug"
    end

    test "create_federal_state/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Location.create_federal_state(@invalid_attrs)
    end

    test "update_federal_state/2 with valid data updates the federal_state" do
      federal_state = federal_state_fixture()
      assert {:ok, federal_state} = Location.update_federal_state(federal_state, @update_attrs)
      assert %FederalState{} = federal_state
      assert federal_state.name == "some updated name"
      assert federal_state.slug == "some updated slug"
    end

    test "update_federal_state/2 with invalid data returns error changeset" do
      federal_state = federal_state_fixture()
      assert {:error, %Ecto.Changeset{}} = Location.update_federal_state(federal_state, @invalid_attrs)
      assert federal_state == Location.get_federal_state!(federal_state.id)
    end

    test "delete_federal_state/1 deletes the federal_state" do
      federal_state = federal_state_fixture()
      assert {:ok, %FederalState{}} = Location.delete_federal_state(federal_state)
      assert_raise Ecto.NoResultsError, fn -> Location.get_federal_state!(federal_state.id) end
    end

    test "change_federal_state/1 returns a federal_state changeset" do
      federal_state = federal_state_fixture()
      assert %Ecto.Changeset{} = Location.change_federal_state(federal_state)
    end
  end

  describe "cities" do
    alias MehrSchulferien.Location.City

    @valid_attrs %{name: "some name", slug: "some slug", zip_code: "some zip_code"}
    @update_attrs %{name: "some updated name", slug: "some updated slug", zip_code: "some updated zip_code"}
    @invalid_attrs %{name: nil, slug: nil, zip_code: nil}

    def city_fixture(attrs \\ %{}) do
      {:ok, city} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Location.create_city()

      city
    end

    test "list_cities/0 returns all cities" do
      city = city_fixture()
      assert Location.list_cities() == [city]
    end

    test "get_city!/1 returns the city with given id" do
      city = city_fixture()
      assert Location.get_city!(city.id) == city
    end

    test "create_city/1 with valid data creates a city" do
      assert {:ok, %City{} = city} = Location.create_city(@valid_attrs)
      assert city.name == "some name"
      assert city.slug == "some slug"
      assert city.zip_code == "some zip_code"
    end

    test "create_city/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Location.create_city(@invalid_attrs)
    end

    test "update_city/2 with valid data updates the city" do
      city = city_fixture()
      assert {:ok, city} = Location.update_city(city, @update_attrs)
      assert %City{} = city
      assert city.name == "some updated name"
      assert city.slug == "some updated slug"
      assert city.zip_code == "some updated zip_code"
    end

    test "update_city/2 with invalid data returns error changeset" do
      city = city_fixture()
      assert {:error, %Ecto.Changeset{}} = Location.update_city(city, @invalid_attrs)
      assert city == Location.get_city!(city.id)
    end

    test "delete_city/1 deletes the city" do
      city = city_fixture()
      assert {:ok, %City{}} = Location.delete_city(city)
      assert_raise Ecto.NoResultsError, fn -> Location.get_city!(city.id) end
    end

    test "change_city/1 returns a city changeset" do
      city = city_fixture()
      assert %Ecto.Changeset{} = Location.change_city(city)
    end
  end

  describe "schools" do
    alias MehrSchulferien.Location.School

    @valid_attrs %{city: "some city", email: "some email", fax: "some fax", homepage: "some homepage", line1: "some line1", line2: "some line2", name: "some name", phone: "some phone", slug: "some slug", street: "some street", zip_code: "some zip_code"}
    @update_attrs %{city: "some updated city", email: "some updated email", fax: "some updated fax", homepage: "some updated homepage", line1: "some updated line1", line2: "some updated line2", name: "some updated name", phone: "some updated phone", slug: "some updated slug", street: "some updated street", zip_code: "some updated zip_code"}
    @invalid_attrs %{city: nil, email: nil, fax: nil, homepage: nil, line1: nil, line2: nil, name: nil, phone: nil, slug: nil, street: nil, zip_code: nil}

    def school_fixture(attrs \\ %{}) do
      {:ok, school} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Location.create_school()

      school
    end

    test "list_schools/0 returns all schools" do
      school = school_fixture()
      assert Location.list_schools() == [school]
    end

    test "get_school!/1 returns the school with given id" do
      school = school_fixture()
      assert Location.get_school!(school.id) == school
    end

    test "create_school/1 with valid data creates a school" do
      assert {:ok, %School{} = school} = Location.create_school(@valid_attrs)
      assert school.city == "some city"
      assert school.email == "some email"
      assert school.fax == "some fax"
      assert school.homepage == "some homepage"
      assert school.line1 == "some line1"
      assert school.line2 == "some line2"
      assert school.name == "some name"
      assert school.phone == "some phone"
      assert school.slug == "some slug"
      assert school.street == "some street"
      assert school.zip_code == "some zip_code"
    end

    test "create_school/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Location.create_school(@invalid_attrs)
    end

    test "update_school/2 with valid data updates the school" do
      school = school_fixture()
      assert {:ok, school} = Location.update_school(school, @update_attrs)
      assert %School{} = school
      assert school.city == "some updated city"
      assert school.email == "some updated email"
      assert school.fax == "some updated fax"
      assert school.homepage == "some updated homepage"
      assert school.line1 == "some updated line1"
      assert school.line2 == "some updated line2"
      assert school.name == "some updated name"
      assert school.phone == "some updated phone"
      assert school.slug == "some updated slug"
      assert school.street == "some updated street"
      assert school.zip_code == "some updated zip_code"
    end

    test "update_school/2 with invalid data returns error changeset" do
      school = school_fixture()
      assert {:error, %Ecto.Changeset{}} = Location.update_school(school, @invalid_attrs)
      assert school == Location.get_school!(school.id)
    end

    test "delete_school/1 deletes the school" do
      school = school_fixture()
      assert {:ok, %School{}} = Location.delete_school(school)
      assert_raise Ecto.NoResultsError, fn -> Location.get_school!(school.id) end
    end

    test "change_school/1 returns a school changeset" do
      school = school_fixture()
      assert %Ecto.Changeset{} = Location.change_school(school)
    end
  end
end
