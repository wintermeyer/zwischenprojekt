defmodule MehrSchulferien.Repo.Migrations.CreateDays do
  use Ecto.Migration

  def change do
    create table(:days) do
      add :value, :date
      add :day_of_month, :integer
      add :weekday, :integer
      add :weekday_de, :string
      add :day_of_the_year, :integer
      add :month_id, references(:months, on_delete: :nothing)
      add :year_id, references(:years, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:days, [:value])
    create index(:days, [:month_id])
    create index(:days, [:year_id])
  end
end
