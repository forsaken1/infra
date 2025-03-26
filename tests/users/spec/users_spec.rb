require 'spec_helper'

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
