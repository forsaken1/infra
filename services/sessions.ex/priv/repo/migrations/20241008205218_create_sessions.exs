defmodule Sessions.Repo.Migrations.CreateSessions do
  use Ecto.Migration

  def change do
    create table(:sessions) do
      add :token, :string
      add :user_id, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
