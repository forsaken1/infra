require "kemal"
require "./config/database"
require "./models/user"

post "/users" do |env|
  user_params = env.params.json
  email = user_params["email"].as(String)
  password = user_params["password"].as(String)

  if User.where { _email == email }.exists?
    env.response.status_code = 400
    env.response.print({error: "Email already exists"}.to_json)
  else
    user = User.new(Hash(Symbol, String).new)
    user.email = email
    user.password = password

    if user.save
      env.response.status_code = 201
      env.response.print({message: "User created successfully", user: user.id}.to_json)
    else
      env.response.status_code = 500
      env.response.print({error: "User creation failed"}.to_json)
    end
  end
end

get "/user" do |env|
  user = current_user(env)

  if user
    env.response.status_code = 200
    env.response.print(user.to_json)
  else
    env.response.status_code = 404
    env.response.print({error: "User not found"}.to_json)
  end
end

put "/user" do |env|
  user = current_user(env)

  if user
    user_params = env.params.json
    user.email = user_params["email"].as(String) if user_params["email"]
    user.password = user_params["password"].as(String) if user_params["password"]

    if user.save
      env.response.status_code = 200
      env.response.print({message: "User updated successfully"}.to_json)
    else
      env.response.status_code = 500
      env.response.print({error: "Failed to update user"}.to_json)
    end
  else
    env.response.status_code = 404
    env.response.print({error: "User not found"}.to_json)
  end
end

post "/passwords" do |env|
  user_params = env.params.json
  email = user_params["email"].as(String)

  user = User.where { _email == email }.first
  if user
    env.response.status_code = 200
    env.response.print({message: "Confirmation code sent to #{email}"}.to_json)
  else
    env.response.status_code = 404
    env.response.print({error: "User not found"}.to_json)
  end
end

def current_user(env : HTTP::Server::Context) : User?
  email = env.request.headers["Authorization"]?
  return nil unless email
  User.where { _email == email }.first
end

Kemal.run
