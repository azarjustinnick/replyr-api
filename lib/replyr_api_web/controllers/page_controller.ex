defmodule ReplyrApiWeb.PageController do
  use ReplyrApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
