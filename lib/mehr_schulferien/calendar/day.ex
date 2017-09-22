defmodule MehrSchulferien.Calendar.Day do
  use Ecto.Schema
  import Ecto.Changeset
  alias MehrSchulferien.Calendar.Day


  schema "days" do
    field :day_of_the_year, :integer
    field :day_of_month, :integer
    field :value, :date
    field :weekday, :integer
    field :weekday_de, :string
    belongs_to :year, MehrSchulferien.Calendar.Year
    belongs_to :month, MehrSchulferien.Calendar.Month

    timestamps()
  end

  @doc false
  def changeset(%Day{} = day, attrs) do
    day
    |> cast(attrs, [:value, :day_of_month, :weekday, :weekday_de, :day_of_the_year, :month_id, :year_id])
    |> validate_required([:value, :day_of_month, :weekday, :weekday_de, :day_of_the_year])
    |> assoc_constraint(:month)
    |> assoc_constraint(:year)
    |> unique_constraint(:value)
  end
end
