defmodule Sessions.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :uuid, :string
    field :email, :string
    field :password_hash, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:uuid, :email, :password_hash])
    |> validate_required([:uuid, :email, :password_hash])
  end
end
