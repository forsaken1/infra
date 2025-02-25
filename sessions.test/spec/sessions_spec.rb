require 'spec_helper'

describe 'Sessions API' do
  # POST /sessions - Create new session
  it 'should create a new session' do
    User.create(
      email: 'testuser@example.com',
      password_hash: BCrypt::Password.create('password123'),
      created_at: Time.now,
      updated_at: Time.now
    )

    expect do
      post '/sessions', {
        email: 'testuser@example.com',
        password: 'password123'
      }
    end.to change { Session.count }.from(0).to(1)

    expect_status(200)
    expect_json_types(success: :boolean, message: :string, user: { uuid: :string, email: :string })
    expect_json(success: true)
  end
end
