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
    resources "/countries", CountryController #, only: [:index, :show]
    resources "/federal_states", FederalStateController #, only: [:index, :show]
    resources "/cities", CityController #, only: [:index, :show]
    resources "/schools", SchoolController #, only: [:index, :show]
    resources "/vacation_periods", VacationPeriodController #, only: [:index, :show]
    resources "/years", YearController #, only: [:index, :show]
    resources "/months", MonthController #, only: [:index, :show]
    resources "/days", DayController

    # resources "/federal_states", FederalStateController, only: [:index, :show] do
    #   resources "/years", YearController, only: [:index, :show]
    # end

  end

  # Other scopes may use custom stacks.
  # scope "/api", MehrSchulferienWeb do
  #   pipe_through :api
  # end
end
