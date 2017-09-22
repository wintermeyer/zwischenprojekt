defmodule MehrSchulferien.Location.Country do
  use Ecto.Schema
  import Ecto.Changeset
  alias MehrSchulferien.Location.Country


  schema "countries" do
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(%Country{} = country, attrs) do
    country
    |> cast(attrs, [:name, :slug])
    |> validate_required([:name, :slug])
    |> unique_constraint(:name)
    |> unique_constraint(:slug)
  end
end
