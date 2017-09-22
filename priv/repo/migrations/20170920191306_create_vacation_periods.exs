defmodule MehrSchulferien.Repo.Migrations.CreateVacationPeriods do
  use Ecto.Migration

  def change do
    create table(:vacation_periods) do
      add :starts_on, :date
      add :ends_on, :date
      add :bank_holiday, :boolean, default: false, null: false
      add :weekend, :boolean, default: false, null: false
      add :no_school, :boolean, default: false, null: false
      add :name, :string
      add :source, :string
      add :country_id, references(:countries, on_delete: :nothing)
      add :federal_state_id, references(:federal_states, on_delete: :nothing)
      add :city_id, references(:cities, on_delete: :nothing)
      add :school_id, references(:schools, on_delete: :nothing)
      add :katholisch, :boolean, default: false, null: false
      add :evangelisch, :boolean, default: false, null: false
      add :juedisch, :boolean, default: false, null: false
      add :islam, :boolean, default: false, null: false

      timestamps()
    end

    create index(:vacation_periods, [:country_id])
    create index(:vacation_periods, [:federal_state_id])
    create index(:vacation_periods, [:city_id])
    create index(:vacation_periods, [:school_id])
  end
end
