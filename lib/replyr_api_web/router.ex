defmodule ReplyrApiWeb.Router do
  use ReplyrApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ReplyrApiWeb do
    pipe_through :api
  end
end
