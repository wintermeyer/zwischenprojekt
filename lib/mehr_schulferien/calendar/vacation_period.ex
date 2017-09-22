defmodule MehrSchulferien.Calendar.VacationPeriod do
  use Ecto.Schema
  import Ecto.Changeset
  alias MehrSchulferien.Calendar.VacationPeriod


  schema "vacation_periods" do
    field :starts_on, :date
    field :ends_on, :date
    field :name, :string
    field :bank_holiday, :boolean, default: false
    field :weekend, :boolean, default: false
    field :no_school, :boolean, default: false
    field :source, :string
    belongs_to :country, MehrSchulferien.Location.Country
    belongs_to :federal_state, MehrSchulferien.Location.FederalState
    belongs_to :city, MehrSchulferien.Location.City
    belongs_to :school, MehrSchulferien.Location.School
    field :katholisch, :boolean, default: false
    field :evangelisch, :boolean, default: false
    field :juedisch, :boolean, default: false
    field :islam, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(%VacationPeriod{} = vacation_period, attrs) do
    vacation_period
    |> cast(attrs, [:starts_on, :ends_on, :bank_holiday, :weekend, :no_school, :name, :source, :country_id, :federal_state_id, :city_id, :school_id, :katholisch, :evangelisch, :juedisch, :islam])
    |> validate_required([:starts_on, :ends_on, :name])
    |> validate_dates_make_sense
    |> validate_one_of_present([:country_id, :federal_state_id, :city_id, :school_id])
    |> unique_constraint(:starts_on, name: :vacation_periods_starts_on_ends_on_country_id_index)
    |> unique_constraint(:starts_on, name: :vacation_periods_starts_on_ends_on_federal_state_id_index)
    |> unique_constraint(:starts_on, name: :vacation_periods_starts_on_ends_on_city_id_index)
    |> unique_constraint(:starts_on, name: :vacation_periods_starts_on_ends_on_school_id_index)
  end

  defp validate_dates_make_sense(changeset) do
    starts_on = get_field(changeset, :starts_on)
    ends_on = get_field(changeset, :ends_on)

    case [starts_on, ends_on] do
      [nil, nil] -> changeset # make sure Date.compare is not called with nil
      [nil, _] -> changeset
      [_, nil] -> changeset
      [_, _] -> case Date.compare(starts_on, ends_on) do
                  :gt -> add_error(changeset, :starts_on, "cannot be later than 'ends_on'")
                  _ -> changeset
                end
    end
  end

  defp validate_one_of_present(changeset, fields) do
    fields
    |> Enum.filter(fn field ->
      # Checks if a field is "present".
      # The logic is copied from `validate_required` in Ecto.
      case get_field(changeset, field) do
        nil -> false
        binary when is_binary(binary) -> String.trim_leading(binary) == ""
        _ -> true
      end
    end)
    |> case do
      # Exactly one field was present.
      [field] ->
        without_id = field
                     |> Atom.to_string
                     |> String.replace_suffix("_id", "")
                     |> String.to_existing_atom
        assoc_constraint(changeset, without_id)
      # Zero or more than one fields were present.
      _ ->
        add_error(changeset, hd(fields), "expected exactly one of #{inspect(fields)} to be present")
    end
  end
end
