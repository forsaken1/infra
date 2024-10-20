defmodule SessionsWeb.Router do
  use SessionsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SessionsWeb do
    pipe_through :api

    get "/session", SessionController, :show
    resources "/sessions", SessionController, only: [:create]
  end
end
