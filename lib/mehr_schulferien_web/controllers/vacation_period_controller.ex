defmodule MehrSchulferienWeb.VacationPeriodController do
  use MehrSchulferienWeb, :controller

  alias MehrSchulferien.Calendar
  alias MehrSchulferien.Calendar.VacationPeriod

  def index(conn, _params) do
    vacation_periods = Calendar.list_vacation_periods()
    render(conn, "index.html", vacation_periods: vacation_periods)
  end

  def new(conn, _params) do
    changeset = Calendar.change_vacation_period(%VacationPeriod{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"vacation_period" => vacation_period_params}) do
    case Calendar.create_vacation_period(vacation_period_params) do
      {:ok, vacation_period} ->
        conn
        |> put_flash(:info, "Vacation period created successfully.")
        |> redirect(to: vacation_period_path(conn, :show, vacation_period))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    vacation_period = Calendar.get_vacation_period!(id)
    render(conn, "show.html", vacation_period: vacation_period)
  end

  def edit(conn, %{"id" => id}) do
    vacation_period = Calendar.get_vacation_period!(id)
    changeset = Calendar.change_vacation_period(vacation_period)
    render(conn, "edit.html", vacation_period: vacation_period, changeset: changeset)
  end

  def update(conn, %{"id" => id, "vacation_period" => vacation_period_params}) do
    vacation_period = Calendar.get_vacation_period!(id)

    case Calendar.update_vacation_period(vacation_period, vacation_period_params) do
      {:ok, vacation_period} ->
        conn
        |> put_flash(:info, "Vacation period updated successfully.")
        |> redirect(to: vacation_period_path(conn, :show, vacation_period))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", vacation_period: vacation_period, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vacation_period = Calendar.get_vacation_period!(id)
    {:ok, _vacation_period} = Calendar.delete_vacation_period(vacation_period)

    conn
    |> put_flash(:info, "Vacation period deleted successfully.")
    |> redirect(to: vacation_period_path(conn, :index))
  end
end
