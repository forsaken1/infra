module UserHelper
  def self.current_user(env : HTTP::Server::Context) : User?
    email = env.request.headers["Authorization"]?
    return nil unless email
    User.where { _email == email }.first
  end
end
