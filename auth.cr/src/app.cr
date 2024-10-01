require "http/server"
require "jwt"

# Replace with your own secret key
SECRET_KEY = ENV["SECRET_KEY"]

# User model (replace with your own user model)
struct User
  id : Int32
  username : String
end

# Function to generate a JWT for a given user
def generate_token(user : User) : String
  payload = JWT::Payload.new do |payload|
    payload.issuer = "auth"
    payload.subject = user.id.to_s
    payload.expiration = Time.utc + 3600 # Token expires in 1 hour
  end

  JWT.sign(payload, SECRET_KEY, "HS256")
end

# Function to decode and verify a JWT
def decode_token(token : String) : User?
  begin
    decoded_payload = JWT.decode(token, SECRET_KEY, "HS256")

    user_id = decoded_payload["sub"].to_i

    # Fetch user details from the database (replace with your own logic)
    user = User.new(id: user_id, username: "example_user")

    return user
  rescue e : JWT::DecodeError
    return nil
  end
end

# HTTP server endpoint for login
server = HTTP::Server.new do |server|
  # server.port = 3000

  server.get "/login" do |context|
    # For simplicity, we assume the user is already authenticated (replace with your own authentication logic)
    user = User.new(id: 1, username: "example_user")

    # Generate a JWT for the authenticated user
    token = generate_token(user)

    context.response.content_type = "application/json"
    context.response.print %({"token": "#{token}"})
  end

  server.get "/protected" do |context|
    # Get the JWT from the Authorization header
    authorization_header = context.request.headers["Authorization"]?
    token = authorization_header.split(" ").last

    if token.nil?
      context.response.status_code = 401
      context.response.print "Unauthorized"
      next
    end

    # Decode and verify the JWT
    user = decode_token(token)

    if user.nil?
      context.response.status_code = 401
      context.response.print "Unauthorized"
    else
      context.response.print "Hello, #{user.username}! This is a protected resource."
    end
  end
end.listen

address = server.bind_tcp 8080
puts "Listening on http://#{address}"
server.listen

# puts "Listening on http://127.0.0.1:3000"
