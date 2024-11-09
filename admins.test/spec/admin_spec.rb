require 'airborne'
require 'database_cleaner-sequel'
require 'sequel'
require 'securerandom'

DB = Sequel.connect('postgres://postgres:@localhost:5432/users_development')

RSpec.configure do |config|
  DatabaseCleaner[:sequel].strategy = :deletion
  DatabaseCleaner[:sequel].db = DB

  config.before(:each) do
    DatabaseCleaner[:sequel].clean
  end
end

Airborne.configure do |config|
  config.base_url = 'http://localhost:5001'
end

class User < Sequel::Model(:users)
  def before_create
    self.uuid = SecureRandom.uuid
    self.created_at = Time.now
    self.updated_at = Time.now
  end
end

describe 'User Management API' do
  # GET /users - Get user list
  it 'should return users' do
    User.create(
      email: 'testuser@example.com',
      password_hash: 'password_hash'
    )

    get '/users'

    expect_status(200)
    expect_json_types(success: :boolean, collection: :array)
    expect_json(success: true)
  end
end
