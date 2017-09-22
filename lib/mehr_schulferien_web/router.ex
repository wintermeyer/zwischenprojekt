defmodule MehrSchulferienWeb.Router do
  use MehrSchulferienWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MehrSchulferienWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/countries", CountryController
    resources "/federal_states", FederalStateController
    resources "/cities", CityController
    resources "/schools", SchoolController
    resources "/vacation_periods", VacationPeriodController
    resources "/years", YearController
    resources "/months", MonthController
  end

  # Other scopes may use custom stacks.
  # scope "/api", MehrSchulferienWeb do
  #   pipe_through :api
  # end
end
