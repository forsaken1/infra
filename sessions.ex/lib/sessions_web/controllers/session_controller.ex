defmodule SessionsWeb.SessionController do
  use SessionsWeb, :controller
  alias Sessions.Accounts

  def create(conn, %{"email" => email, "password" => password}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, user} ->
        token = Accounts.generate_session_token()

        conn
        |> json(%{
          success: true,
          message: "Logged in successfully",
          user_id: user.id,
          session_token: token
        })

      {:error, reason} ->
        conn
        |> json(%{success: false, error: reason})
    end
  end
end
