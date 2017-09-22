defmodule MehrSchulferien.Location.City do
  use Ecto.Schema
  import Ecto.Changeset
  alias MehrSchulferien.Location.City


  schema "cities" do
    field :name, :string
    field :slug, :string
    field :zip_code, :string
    belongs_to :country, MehrSchulferien.Location.Country
    belongs_to :federal_state, MehrSchulferien.Location.FederalState

    timestamps()
  end

  @doc false
  def changeset(%City{} = city, attrs) do
    city
    |> cast(attrs, [:name, :slug, :zip_code])
    |> validate_required([:name, :slug, :zip_code])
    |> unique_constraint(:slug)
    |> assoc_constraint(:federal_state)
    |> assoc_constraint(:country)
  end
end
