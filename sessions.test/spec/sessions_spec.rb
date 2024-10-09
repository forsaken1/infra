require 'airborne'
require 'database_cleaner-sequel'
require 'sequel'
require 'bcrypt'

DB = Sequel.connect('postgres://postgres:@localhost:5432/sessions_development')

RSpec.configure do |config|
  DatabaseCleaner[:sequel].strategy = :deletion
  DatabaseCleaner[:sequel].db = DB

  config.before(:each) do
    DatabaseCleaner[:sequel].clean
  end
end

Airborne.configure do |config|
  config.base_url = 'http://localhost:4000'
end

class User < Sequel::Model(:users)
end

class Session < Sequel::Model(:sessions)
end

describe 'User Registration and Management API' do
  # POST /sessions - Create new session
  it 'should create a new session' do
    User.create(
      email: 'testuser@example.com',
      password_hash: BCrypt::Password.create('password123'),
      inserted_at: Time.now,
      updated_at: Time.now
    )

    expect do
      post '/sessions', {
        email: 'testuser@example.com',
        password: 'password123'
      }
    end.to change { Session.count }.from(0).to(1)

    expect_status(200)
    expect_json_types(success: :boolean, message: :string, user: { id: :integer, email: :string })
    expect_json(success: true)
  end
end
