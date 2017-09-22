defmodule MehrSchulferien.Location.FederalState do
  use Ecto.Schema
  import Ecto.Changeset
  alias MehrSchulferien.Location.FederalState


  schema "federal_states" do
    field :name, :string
    field :slug, :string
    belongs_to :country, MehrSchulferien.Location.Country

    timestamps()
  end

  @doc false
  def changeset(%FederalState{} = federal_state, attrs) do
    federal_state
    |> cast(attrs, [:name, :slug])
    |> validate_required([:name, :slug])
    |> unique_constraint(:name)
    |> unique_constraint(:slug)
    |> assoc_constraint(:country)
  end
end
