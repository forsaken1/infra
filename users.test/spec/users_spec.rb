require 'airborne'
require 'database_cleaner-sequel'
require 'sequel'

RSpec.configure do |config|
  DatabaseCleaner[:sequel].strategy = :deletion
  DatabaseCleaner[:sequel].db = Sequel.connect('postgres://postgres:postgres@localhost:5432/users_development')

  config.before(:each) do
    DatabaseCleaner[:sequel].clean
  end
end

Airborne.configure do |config|
  config.base_url = 'http://localhost:3000'
end

describe 'User Registration and Management API' do
  # POST /users - Create new user (registration)
  it 'should create a new user' do
    post '/users', {
      email: 'testuser@example.com',
      password: 'password123'
    }

    expect_status(201)
    expect_json_types(success: :boolean, message: :string)
    expect_json(success: true)
  end
end
