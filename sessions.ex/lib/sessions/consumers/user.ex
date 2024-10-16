defmodule Sessions.Consumers.User do
  use KafkaEx.GenConsumer

  alias KafkaEx.Protocol.Fetch.Message
  alias Sessions.Accounts.User
  alias Sessions.Repo

  require Logger

  def handle_message_set(message_set, state) do
    for %Message{value: message} <- message_set do
      Logger.debug(fn -> "message: " <> inspect(message) end)

      {status, data} = Jason.decode(message)

      if status == :error do
        IO.puts("Failed to parse JSON: #{reason}")
      end

      Repo.insert(%User{email: data["email"], password_hash: data["password_hash"]})
    end
    {:async_commit, state}
  end
end
