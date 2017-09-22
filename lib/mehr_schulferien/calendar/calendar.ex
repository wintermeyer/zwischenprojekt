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
end
