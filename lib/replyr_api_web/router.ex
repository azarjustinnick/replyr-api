defmodule ReplyrApiWeb.Router do
  use ReplyrApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ReplyrApiWeb do
    pipe_through :api

    get "/", HomeController, :index
  end
end
