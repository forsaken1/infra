require 'spec_helper'

describe 'Health checker' do
  # GET /health - Check health
  it 'responds successfully' do
    get '/health'

    expect_status(200)
    expect_json_types(success: :boolean)
    expect_json(success: true)
  end
end
