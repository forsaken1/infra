require "http/client"
require "json"

module UserHelper
  def self.current_user(env : HTTP::Server::Context) : User?
    token = env.request.headers["auth-token"]?
    return nil unless token

    response = HTTP::Client.get("http://localhost:4000/session?token=#{URI.encode_path(token)}")

    if response.status_code == 200
      return User.all.find_by!({ :uuid => JSON.parse(response.body)["user"]["uuid"] })
    end
  rescue
    nil
  end
end