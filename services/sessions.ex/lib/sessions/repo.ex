defmodule Sessions.Repo do
  use Ecto.Repo,
    otp_app: :sessions,
    adapter: Ecto.Adapters.Postgres
end
