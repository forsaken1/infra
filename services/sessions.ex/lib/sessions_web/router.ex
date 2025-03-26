defmodule SessionsWeb.Router do
  use SessionsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SessionsWeb do
    pipe_through :api

    get "/health", BaseController, :health
    get "/session", SessionController, :show
    resources "/sessions", SessionController, only: [:create]
  end
end
