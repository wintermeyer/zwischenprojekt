defmodule MehrSchulferien.Repo.Migrations.CreateSchools do
  use Ecto.Migration

  def change do
    create table(:schools) do
      add :name, :string
      add :slug, :string
      add :line1, :string
      add :line2, :string
      add :street, :string
      add :zip_code, :string
      add :city_in_address, :string
      add :phone, :string
      add :fax, :string
      add :email, :string
      add :homepage, :string
      add :country_id, references(:countries, on_delete: :nothing)
      add :federal_state_id, references(:federal_states, on_delete: :nothing)
      add :city_id, references(:cities, on_delete: :nothing)

      timestamps()
    end

    create index(:schools, [:name])
    create unique_index(:schools, [:slug])
    create index(:schools, [:country_id])
    create index(:schools, [:federal_state_id])
    create index(:schools, [:city_id])
  end
end
