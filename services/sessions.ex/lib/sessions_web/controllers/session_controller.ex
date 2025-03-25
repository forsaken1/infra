defmodule SessionsWeb.SessionController do
  use SessionsWeb, :controller

  alias Sessions.Accounts
  alias Sessions.Accounts.Session
  alias Sessions.Accounts.User
  alias Sessions.Repo

  require Logger

  def show(conn, params) do
    token = params["token"]
    session = Repo.get_by! Session, token: token
    user = Repo.get! User, session.user_id

    json(conn, %{
      success: true,
      user: %{ uuid: user.uuid, email: user.email },
      session: %{ id: session.id, token: token }
    })
  end

  def create(conn, %{"email" => email, "password" => password}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, user} ->
        token = Accounts.generate_session_token()

        {_, session} = %Session{user_id: user.id, token: token}
                       |> Repo.insert

        conn
        |> json(%{
          success: true,
          message: "Logged in successfully",
          user: %{ uuid: user.uuid, email: user.email },
          session: %{ id: session.id, token: token }
        })

      {:error, reason} ->
        conn
        |> json(%{success: false, error: reason})
    end
  end
end
