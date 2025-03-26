defmodule Sessions.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sessions.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password_hash: "some password_hash"
      })
      |> Sessions.Accounts.create_user()

    user
  end

  @doc """
  Generate a session.
  """
  def session_fixture(attrs \\ %{}) do
    {:ok, session} =
      attrs
      |> Enum.into(%{
        token: "some token",
        user_id: 42
      })
      |> Sessions.Accounts.create_session()

    session
  end
end
