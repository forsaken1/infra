defmodule SessionsWeb.Router do
  use SessionsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SessionsWeb do
    pipe_through :api

    resources "/sessions", SessionController, only: [:create]
  end
end
