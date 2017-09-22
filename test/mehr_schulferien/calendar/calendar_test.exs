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
end
