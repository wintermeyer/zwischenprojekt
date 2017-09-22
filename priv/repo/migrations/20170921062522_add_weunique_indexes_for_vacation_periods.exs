defmodule MehrSchulferien.Repo.Migrations.AddWeuniqueIndexesForVacationPeriods do
  use Ecto.Migration

  def change do
    create unique_index(:vacation_periods, [:starts_on, :ends_on, :country_id])
    create unique_index(:vacation_periods, [:starts_on, :ends_on, :federal_state_id])
    create unique_index(:vacation_periods, [:starts_on, :ends_on, :city_id])
    create unique_index(:vacation_periods, [:starts_on, :ends_on, :school_id])
  end
end
