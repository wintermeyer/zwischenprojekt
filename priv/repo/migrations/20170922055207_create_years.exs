defmodule MehrSchulferien.Repo.Migrations.CreateYears do
  use Ecto.Migration

  def change do
    create table(:years) do
      add :value, :integer

      timestamps()
    end

    create index(:years, [:value])
  end
end
