defmodule MehrSchulferien.Repo.Migrations.CreateMonths do
  use Ecto.Migration

  def change do
    create table(:months) do
      add :value, :integer
      add :year_id, references(:years, on_delete: :nothing)

      timestamps()
    end

    create index(:months, [:value])
    create index(:months, [:year_id])
  end
end
