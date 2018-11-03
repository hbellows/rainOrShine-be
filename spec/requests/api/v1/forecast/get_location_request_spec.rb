require 'rails_helper'

xdescribe 'GET forecast' do
  it 'can get location' do
    # GET /api/v1/forecast?location=denver,co
    location = 'denver,co'

    get "/api/v1/forecast?location=#{location}"

    expect(response.status).to eq(200)

    returned_location = JSON.parse(response.body, symbolize_names: true)
  end
end