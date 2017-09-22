defmodule MehrSchulferien.CalendarTest do
  use MehrSchulferien.DataCase

  alias MehrSchulferien.Calendar

  describe "vacation_periods" do
    alias MehrSchulferien.Calendar.VacationPeriod

    @valid_attrs %{bank_holiday: true, ends_on: ~D[2010-04-17], name: "some name", starts_on: ~D[2010-04-17], weekend: true}
    @update_attrs %{bank_holiday: false, ends_on: ~D[2011-05-18], name: "some updated name", starts_on: ~D[2011-05-18], weekend: false}
    @invalid_attrs %{bank_holiday: nil, ends_on: nil, name: nil, starts_on: nil, weekend: nil}

    def vacation_period_fixture(attrs \\ %{}) do
      {:ok, vacation_period} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Calendar.create_vacation_period()

      vacation_period
    end

    test "list_vacation_periods/0 returns all vacation_periods" do
      vacation_period = vacation_period_fixture()
      assert Calendar.list_vacation_periods() == [vacation_period]
    end

    test "get_vacation_period!/1 returns the vacation_period with given id" do
      vacation_period = vacation_period_fixture()
      assert Calendar.get_vacation_period!(vacation_period.id) == vacation_period
    end

    test "create_vacation_period/1 with valid data creates a vacation_period" do
      assert {:ok, %VacationPeriod{} = vacation_period} = Calendar.create_vacation_period(@valid_attrs)
      assert vacation_period.bank_holiday == true
      assert vacation_period.ends_on == ~D[2010-04-17]
      assert vacation_period.name == "some name"
      assert vacation_period.starts_on == ~D[2010-04-17]
      assert vacation_period.weekend == true
    end

    test "create_vacation_period/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Calendar.create_vacation_period(@invalid_attrs)
    end

    test "update_vacation_period/2 with valid data updates the vacation_period" do
      vacation_period = vacation_period_fixture()
      assert {:ok, vacation_period} = Calendar.update_vacation_period(vacation_period, @update_attrs)
      assert %VacationPeriod{} = vacation_period
      assert vacation_period.bank_holiday == false
      assert vacation_period.ends_on == ~D[2011-05-18]
      assert vacation_period.name == "some updated name"
      assert vacation_period.starts_on == ~D[2011-05-18]
      assert vacation_period.weekend == false
    end

    test "update_vacation_period/2 with invalid data returns error changeset" do
      vacation_period = vacation_period_fixture()
      assert {:error, %Ecto.Changeset{}} = Calendar.update_vacation_period(vacation_period, @invalid_attrs)
      assert vacation_period == Calendar.get_vacation_period!(vacation_period.id)
    end

    test "delete_vacation_period/1 deletes the vacation_period" do
      vacation_period = vacation_period_fixture()
      assert {:ok, %VacationPeriod{}} = Calendar.delete_vacation_period(vacation_period)
      assert_raise Ecto.NoResultsError, fn -> Calendar.get_vacation_period!(vacation_period.id) end
    end

    test "change_vacation_period/1 returns a vacation_period changeset" do
      vacation_period = vacation_period_fixture()
      assert %Ecto.Changeset{} = Calendar.change_vacation_period(vacation_period)
    end
  end

  describe "years" do
    alias MehrSchulferien.Calendar.Year

    @valid_attrs %{value: "some value"}
    @update_attrs %{value: "some updated value"}
    @invalid_attrs %{value: nil}

    def year_fixture(attrs \\ %{}) do
      {:ok, year} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Calendar.create_year()

      year
    end

    test "list_years/0 returns all years" do
      year = year_fixture()
      assert Calendar.list_years() == [year]
    end

    test "get_year!/1 returns the year with given id" do
      year = year_fixture()
      assert Calendar.get_year!(year.id) == year
    end

    test "create_year/1 with valid data creates a year" do
      assert {:ok, %Year{} = year} = Calendar.create_year(@valid_attrs)
      assert year.value == "some value"
    end

    test "create_year/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Calendar.create_year(@invalid_attrs)
    end

    test "update_year/2 with valid data updates the year" do
      year = year_fixture()
      assert {:ok, year} = Calendar.update_year(year, @update_attrs)
      assert %Year{} = year
      assert year.value == "some updated value"
    end

    test "update_year/2 with invalid data returns error changeset" do
      year = year_fixture()
      assert {:error, %Ecto.Changeset{}} = Calendar.update_year(year, @invalid_attrs)
      assert year == Calendar.get_year!(year.id)
    end

    test "delete_year/1 deletes the year" do
      year = year_fixture()
      assert {:ok, %Year{}} = Calendar.delete_year(year)
      assert_raise Ecto.NoResultsError, fn -> Calendar.get_year!(year.id) end
    end

    test "change_year/1 returns a year changeset" do
      year = year_fixture()
      assert %Ecto.Changeset{} = Calendar.change_year(year)
    end
  end

  describe "months" do
    alias MehrSchulferien.Calendar.Month

    @valid_attrs %{value: 42}
    @update_attrs %{value: 43}
    @invalid_attrs %{value: nil}

    def month_fixture(attrs \\ %{}) do
      {:ok, month} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Calendar.create_month()

      month
    end

    test "list_months/0 returns all months" do
      month = month_fixture()
      assert Calendar.list_months() == [month]
    end

    test "get_month!/1 returns the month with given id" do
      month = month_fixture()
      assert Calendar.get_month!(month.id) == month
    end

    test "create_month/1 with valid data creates a month" do
      assert {:ok, %Month{} = month} = Calendar.create_month(@valid_attrs)
      assert month.value == 42
    end

    test "create_month/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Calendar.create_month(@invalid_attrs)
    end

    test "update_month/2 with valid data updates the month" do
      month = month_fixture()
      assert {:ok, month} = Calendar.update_month(month, @update_attrs)
      assert %Month{} = month
      assert month.value == 43
    end

    test "update_month/2 with invalid data returns error changeset" do
      month = month_fixture()
      assert {:error, %Ecto.Changeset{}} = Calendar.update_month(month, @invalid_attrs)
      assert month == Calendar.get_month!(month.id)
    end

    test "delete_month/1 deletes the month" do
      month = month_fixture()
      assert {:ok, %Month{}} = Calendar.delete_month(month)
      assert_raise Ecto.NoResultsError, fn -> Calendar.get_month!(month.id) end
    end

    test "change_month/1 returns a month changeset" do
      month = month_fixture()
      assert %Ecto.Changeset{} = Calendar.change_month(month)
    end
  end

  describe "days" do
    alias MehrSchulferien.Calendar.Day

    @valid_attrs %{day_of_the_year: 42, value: 42, weekday: 42, weekday_de: "some weekday_de"}
    @update_attrs %{day_of_the_year: 43, value: 43, weekday: 43, weekday_de: "some updated weekday_de"}
    @invalid_attrs %{day_of_the_year: nil, value: nil, weekday: nil, weekday_de: nil}

    def day_fixture(attrs \\ %{}) do
      {:ok, day} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Calendar.create_day()

      day
    end

    test "list_days/0 returns all days" do
      day = day_fixture()
      assert Calendar.list_days() == [day]
    end

    test "get_day!/1 returns the day with given id" do
      day = day_fixture()
      assert Calendar.get_day!(day.id) == day
    end

    test "create_day/1 with valid data creates a day" do
      assert {:ok, %Day{} = day} = Calendar.create_day(@valid_attrs)
      assert day.day_of_the_year == 42
      assert day.value == 42
      assert day.weekday == 42
      assert day.weekday_de == "some weekday_de"
    end

    test "create_day/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Calendar.create_day(@invalid_attrs)
    end

    test "update_day/2 with valid data updates the day" do
      day = day_fixture()
      assert {:ok, day} = Calendar.update_day(day, @update_attrs)
      assert %Day{} = day
      assert day.day_of_the_year == 43
      assert day.value == 43
      assert day.weekday == 43
      assert day.weekday_de == "some updated weekday_de"
    end

    test "update_day/2 with invalid data returns error changeset" do
      day = day_fixture()
      assert {:error, %Ecto.Changeset{}} = Calendar.update_day(day, @invalid_attrs)
      assert day == Calendar.get_day!(day.id)
    end

    test "delete_day/1 deletes the day" do
      day = day_fixture()
      assert {:ok, %Day{}} = Calendar.delete_day(day)
      assert_raise Ecto.NoResultsError, fn -> Calendar.get_day!(day.id) end
    end

    test "change_day/1 returns a day changeset" do
      day = day_fixture()
      assert %Ecto.Changeset{} = Calendar.change_day(day)
    end
  end
end
