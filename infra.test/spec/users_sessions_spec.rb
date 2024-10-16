require 'spec_helper'

EVENT_SENDING_DELAY_SEC = 1

describe 'Registration and Auhtentification' do
  it do
    # send request to users service to create a new user
    post users_url("users"), {
      email: 'testuser@example.com',
      password: 'password123'
    }
    expect_status(201)
    expect_json(success: true)

    # check user is exist in users DB
    expect(Users::User.where(email: 'testuser@example.com').first).not_to be_nil

    # waiting for event sending
    sleep EVENT_SENDING_DELAY_SEC

    # check user is exist in sessions DB
    expect(Sessions::User.where(email: 'testuser@example.com').first).not_to be_nil

    # send request to sessions service
    expect do
      post sessions_url('sessions'), {
        email: 'testuser@example.com',
        password: 'password123'
      }
      expect_status(200)
      expect_json(success: true)
    end.to change { Sessions::Session.count }.from(0).to(1)

    # check user's data availability
  end
end
