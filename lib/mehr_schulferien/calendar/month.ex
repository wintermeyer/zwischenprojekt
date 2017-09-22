defmodule MehrSchulferien.Calendar.Month do
  use Ecto.Schema
  import Ecto.Changeset
  alias MehrSchulferien.Calendar.Month


  schema "months" do
    field :value, :integer
    field :year_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Month{} = month, attrs) do
    month
    |> cast(attrs, [:value, :year_id])
    |> validate_required([:value, :year_id])
  end
end
