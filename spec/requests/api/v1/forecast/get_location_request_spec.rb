require 'rails_helper'

xdescribe 'GET forecast' do
  it 'can get forecast' do
    # GET /api/v1/forecast?location=denver,co
    location = 'denver,co'
    VCR.use_cassette('get_forecast') do
     get "/api/v1/forecast?location=#{location}"
    end


    expect(response.status).to eq(200)

    returned_location = JSON.parse(response.body, symbolize_names: true)
  end
end