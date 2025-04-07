require 'spec_helper'

describe 'Admin API' do
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
