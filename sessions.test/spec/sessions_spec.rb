require 'airborne'
require 'database_cleaner-sequel'
require 'sequel'

RSpec.configure do |config|
  DatabaseCleaner[:sequel].strategy = :deletion
  DatabaseCleaner[:sequel].db = Sequel.connect('postgres://postgres:@localhost:5432/sessions_development')

  config.before(:each) do
    DatabaseCleaner[:sequel].clean
  end
end

Airborne.configure do |config|
  config.base_url = 'http://localhost:4000'
end

describe 'User Registration and Management API' do
  # POST /sessions - Create new session
  it 'should create a new session' do
    post '/sessions', {
      email: 'testuser@example.com',
      password: 'password123'
    }

    pp body

    expect_status(200)
    expect_json_types(success: :boolean, message: :string)
    expect_json(success: true)
  end
end
