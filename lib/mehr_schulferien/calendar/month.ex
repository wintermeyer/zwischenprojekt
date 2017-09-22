defmodule MehrSchulferien.Calendar.Month do
  use Ecto.Schema
  import Ecto.Changeset
  alias MehrSchulferien.Calendar.Month


  schema "months" do
    field :value, :integer
    belongs_to :year, MehrSchulferien.Calendar.Year

    timestamps()
  end

  @doc false
  def changeset(%Month{} = month, attrs) do
    month
    |> cast(attrs, [:value, :year_id])
    |> validate_required([:value, :year_id])
    |> assoc_constraint(:year)
  end
end
