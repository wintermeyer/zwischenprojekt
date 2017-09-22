defmodule MehrSchulferien.Calendar do
  @moduledoc """
  The Calendar context.
  """

  import Ecto.Query, warn: false
  alias MehrSchulferien.Repo

  alias MehrSchulferien.Calendar.VacationPeriod

  @doc """
  Returns the list of vacation_periods.

  ## Examples

      iex> list_vacation_periods()
      [%VacationPeriod{}, ...]

  """
  def list_vacation_periods do
    Repo.all(VacationPeriod)
  end

  @doc """
  Gets a single vacation_period.

  Raises `Ecto.NoResultsError` if the Vacation period does not exist.

  ## Examples

      iex> get_vacation_period!(123)
      %VacationPeriod{}

      iex> get_vacation_period!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vacation_period!(id), do: Repo.get!(VacationPeriod, id)

  @doc """
  Creates a vacation_period.

  ## Examples

      iex> create_vacation_period(%{field: value})
      {:ok, %VacationPeriod{}}

      iex> create_vacation_period(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vacation_period(attrs \\ %{}) do
    %VacationPeriod{}
    |> VacationPeriod.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vacation_period.

  ## Examples

      iex> update_vacation_period(vacation_period, %{field: new_value})
      {:ok, %VacationPeriod{}}

      iex> update_vacation_period(vacation_period, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vacation_period(%VacationPeriod{} = vacation_period, attrs) do
    vacation_period
    |> VacationPeriod.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a VacationPeriod.

  ## Examples

      iex> delete_vacation_period(vacation_period)
      {:ok, %VacationPeriod{}}

      iex> delete_vacation_period(vacation_period)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vacation_period(%VacationPeriod{} = vacation_period) do
    Repo.delete(vacation_period)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vacation_period changes.

  ## Examples

      iex> change_vacation_period(vacation_period)
      %Ecto.Changeset{source: %VacationPeriod{}}

  """
  def change_vacation_period(%VacationPeriod{} = vacation_period) do
    VacationPeriod.changeset(vacation_period, %{})
  end

  alias MehrSchulferien.Calendar.Year

  @doc """
  Returns the list of years.

  ## Examples

      iex> list_years()
      [%Year{}, ...]

  """
  def list_years do
    Repo.all(Year)
  end

  @doc """
  Gets a single year.

  Raises `Ecto.NoResultsError` if the Year does not exist.

  ## Examples

      iex> get_year!(123)
      %Year{}

      iex> get_year!(456)
      ** (Ecto.NoResultsError)

  """
  def get_year!(id), do: Repo.get!(Year, id)

  @doc """
  Creates a year.

  ## Examples

      iex> create_year(%{field: value})
      {:ok, %Year{}}

      iex> create_year(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_year(attrs \\ %{}) do
    %Year{}
    |> Year.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a year.

  ## Examples

      iex> update_year(year, %{field: new_value})
      {:ok, %Year{}}

      iex> update_year(year, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_year(%Year{} = year, attrs) do
    year
    |> Year.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Year.

  ## Examples

      iex> delete_year(year)
      {:ok, %Year{}}

      iex> delete_year(year)
      {:error, %Ecto.Changeset{}}

  """
  def delete_year(%Year{} = year) do
    Repo.delete(year)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking year changes.

  ## Examples

      iex> change_year(year)
      %Ecto.Changeset{source: %Year{}}

  """
  def change_year(%Year{} = year) do
    Year.changeset(year, %{})
  end

  alias MehrSchulferien.Calendar.Month

  @doc """
  Returns the list of months.

  ## Examples

      iex> list_months()
      [%Month{}, ...]

  """
  def list_months do
    Repo.all(Month)
  end

  @doc """
  Gets a single month.

  Raises `Ecto.NoResultsError` if the Month does not exist.

  ## Examples

      iex> get_month!(123)
      %Month{}

      iex> get_month!(456)
      ** (Ecto.NoResultsError)

  """
  def get_month!(id), do: Repo.get!(Month, id)

  @doc """
  Creates a month.

  ## Examples

      iex> create_month(%{field: value})
      {:ok, %Month{}}

      iex> create_month(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_month(attrs \\ %{}) do
    %Month{}
    |> Month.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a month.

  ## Examples

      iex> update_month(month, %{field: new_value})
      {:ok, %Month{}}

      iex> update_month(month, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_month(%Month{} = month, attrs) do
    month
    |> Month.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Month.

  ## Examples

      iex> delete_month(month)
      {:ok, %Month{}}

      iex> delete_month(month)
      {:error, %Ecto.Changeset{}}

  """
  def delete_month(%Month{} = month) do
    Repo.delete(month)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking month changes.

  ## Examples

      iex> change_month(month)
      %Ecto.Changeset{source: %Month{}}

  """
  def change_month(%Month{} = month) do
    Month.changeset(month, %{})
  end
end
