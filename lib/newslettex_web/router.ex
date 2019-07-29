defmodule NewslettexWeb.Router do
  use NewslettexWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # Commented until we use it.
  # pipeline :api do
  #   plug :accepts, ["json"]
  # end

  scope "/", NewslettexWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/lists", ListController
  end

  # Other scopes may use custom stacks.
  # scope "/api", NewslettexWeb do
  #   pipe_through :api
  # end
end
