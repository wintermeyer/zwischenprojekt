defmodule MehrSchulferien.Location.School do
  use Ecto.Schema
  import Ecto.Changeset
  alias MehrSchulferien.Location.School


  schema "schools" do
    field :city_in_address, :string
    field :email, :string
    field :fax, :string
    field :homepage, :string
    field :line1, :string
    field :line2, :string
    field :name, :string
    field :phone, :string
    field :slug, :string
    field :street, :string
    field :zip_code, :string
    belongs_to :country, MehrSchulferien.Location.Country
    belongs_to :federal_state, MehrSchulferien.Location.FederalState
    belongs_to :city, MehrSchulferien.Location.City

    timestamps()
  end

  @doc false
  def changeset(%School{} = school, attrs) do
    school
    |> cast(attrs, [:name, :slug, :line1, :line2, :street, :zip_code, :city_in_address, :phone, :fax, :email, :homepage, :country_id, :federal_state_id, :city_id])
    |> validate_required([:name, :slug, :line1, :zip_code, :city_in_address, :country_id, :federal_state_id, :city_id])
    |> unique_constraint(:slug)
    |> assoc_constraint(:country)
    |> assoc_constraint(:federal_state)
    |> assoc_constraint(:city)
  end
end
