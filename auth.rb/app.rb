require 'sinatra'
require 'pg'
require 'bcrypt'
require 'jwt'
require './models.rb'

# Database connection settings
set :db_conn, PG.connect(host: 'db', dbname: 'auth_service', user: 'user', password: 'password')

get '/' do
  'Auth.rb is running'
end

post '/signup' do
  request.body.rewind
  request_payload = JSON.parse request.body.read

  user = User.create(request_payload["name"], request_payload["email"], request_payload["password"], settings.db_conn)

  status user ? 201 : 500
end

post '/auth' do
  request.body.rewind
  request_payload = JSON.parse request.body.read

  user = User.authenticate(request_payload["email"], request_payload["password"], settings.db_conn)
  
  if user
    token = JWT.encode({user_id: user[:id], exp: Time.now.to_i + 60 * 60}, "your_secret", 'HS256')
    {token: token}.to_json
  else
    status 401
  end
end

get '/protected' do
  halt 401, {message: 'Unauthorized'}.to_json unless request.env['HTTP_AUTHORIZATION']
  
  begin
    token = request.env['HTTP_AUTHORIZATION'].split(' ').last
    decoded_token = JWT.decode(token, SECRET_KEY, true, {algorithm: 'HS256'})
    user_id = decoded_token.first['user_id']
    "Welcome, user #{user_id}"
  rescue JWT::DecodeError
    halt 401, {message: 'Unauthorized'}.to_json
  end
end
