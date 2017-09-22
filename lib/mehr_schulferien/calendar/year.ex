defmodule MehrSchulferien.Calendar.Year do
  use Ecto.Schema
  import Ecto.Changeset
  alias MehrSchulferien.Calendar.Year


  schema "years" do
    field :value, :integer

    timestamps()
  end

  @doc false
  def changeset(%Year{} = year, attrs) do
    year
    |> cast(attrs, [:value])
    |> validate_required([:value])
  end
end
