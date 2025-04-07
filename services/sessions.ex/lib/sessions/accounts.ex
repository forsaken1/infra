defmodule Sessions.Accounts do
  alias Sessions.Accounts.User
  alias Sessions.Repo

  import Ecto.Query, warn: false

  def authenticate_user(email, password) do
    user = Repo.get_by(User, email: email)

    case user do
      nil -> {:error, "User not found"}
      _ ->
        if Bcrypt.verify_pass(password, user.password_hash) do
          {:ok, user}
        else
          {:error, "Incorrect password"}
        end
    end
  end

  def generate_session_token do
    :crypto.strong_rand_bytes(32) |> Base.encode64()
  end
end
