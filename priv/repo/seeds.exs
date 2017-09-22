# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MehrSchulferien.Repo.insert!(%MehrSchulferien.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias MehrSchulferien.Location
alias MehrSchulferien.Calendar
import Ecto.Query

# Create Germany as a country
#
{:ok, germany} = Location.create_country(%{name: "Deutschland", slug: "deutschland"})

# Create the federal states of Germany
#
{:ok, badenwuerttemberg} = Location.create_federal_state(%{name: "Baden-Württemberg", slug: "baden-wuerttemberg", country_id: germany.id})
{:ok, bayern} = Location.create_federal_state(%{name: "Bayern", slug: "bayern", country_id: germany.id})
{:ok, berlin} = Location.create_federal_state(%{name: "Berlin", slug: "berlin", country_id: germany.id})
{:ok, brandenburg} = Location.create_federal_state(%{name: "Brandenburg", slug: "brandenburg", country_id: germany.id})
{:ok, bremen} = Location.create_federal_state(%{name: "Bremen", slug: "bremen", country_id: germany.id})
{:ok, hamburg} = Location.create_federal_state(%{name: "Hamburg", slug: "hamburg", country_id: germany.id})
{:ok, hessen} = Location.create_federal_state(%{name: "Hessen", slug: "hessen", country_id: germany.id})
{:ok, mecklenburgvorpommern} = Location.create_federal_state(%{name: "Mecklenburg-Vorpommern", slug: "mecklenburg-vorpommern", country_id: germany.id})
{:ok, niedersachsen} = Location.create_federal_state(%{name: "Niedersachsen", slug: "niedersachsen", country_id: germany.id})
{:ok, nordrheinwestfalen} = Location.create_federal_state(%{name: "Nordrhein-Westfalen", slug: "nordrhein-westfalen", country_id: germany.id})
{:ok, rheinlandpfalz} = Location.create_federal_state(%{name: "Rheinland-Pfalz", slug: "rheinland-pfalz", country_id: germany.id})
{:ok, saarland} = Location.create_federal_state(%{name: "Saarland", slug: "saarland", country_id: germany.id})
{:ok, sachsen} = Location.create_federal_state(%{name: "Sachsen", slug: "sachsen", country_id: germany.id})
{:ok, sachsenanhalt} = Location.create_federal_state(%{name: "Sachsen-Anhalt", slug: "sachsen-anhalt", country_id: germany.id})
{:ok, schleswigholstein} = Location.create_federal_state(%{name: "Schleswig-Holstein", slug: "schleswig-holstein", country_id: germany.id})
{:ok, thueringen} = Location.create_federal_state(%{name: "Thüringen", slug: "thueringen", country_id: germany.id})

Enum.each (2016..2020), fn year_number ->
  case Calendar.create_year(%{value: year_number}) do
    {:ok, year} ->
      {:ok, first_day} = Date.from_erl({year_number, 1, 1})
      Enum.each (0..366), fn counter ->
        day = Date.add(first_day, counter)
        case day.year do
          ^year_number -> weekday_de = case Date.day_of_week(day) do
                          1 -> "Montag"
                          2 -> "Dienstag"
                          3 -> "Mittwoch"
                          4 -> "Donnerstag"
                          5 -> "Freitag"
                          6 -> "Samstag"
                          7 -> "Sonntag"
                          _ -> nil
                        end

                        case day.day do
                          1 -> {:ok, month} = Calendar.create_month(%{value: day.month, year_id: year.id})
                          _ -> query = from m in Calendar.Month, where: m.value == ^day.month, where: m.year_id == ^year.id
                               month = MehrSchulferien.Repo.one(query)
                        end

                        Calendar.create_day(%{value: day, day_of_month: day.day, year_id: year.id, month_id: month.id, weekday: Date.day_of_week(day), weekday_de: weekday_de, day_of_the_year: counter + 1 })
          _ -> nil
        end
      _ -> nil
    end
  end
end
