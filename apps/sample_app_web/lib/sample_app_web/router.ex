defmodule SampleApp.Web.Router do
  use SampleApp.Web, :router

  alias SampleApp.Web.CalculationController

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    get  "/:operation/:operand",
          CalculationController,
          :show
  end

  scope "/", SampleApp.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", SampleApp.Web do
  #   pipe_through :api
  # end
end
