require 'rails_helper'

describe 'guest visits /api/v1/forecasts' do
  context 'GET request' do
    it 'it returns a forecast for a specific location' do
      VCR.use_cassette('get_forecast') do
        user_location = 'denver,co'
        get "/api/v1/forecast?location=#{user_location}"

        expect(response.status).to eq(200)

        returned_forecast = JSON.parse(response.body, symbolize_names: true)

        expect(returned_forecast).to be_a(Hash)
        expect(returned_forecast).to have_key(:data)
        expect(returned_forecast[:data]).to have_key(:id)
        expect(returned_forecast[:data][:id]).to eq(user_location)
        expect(returned_forecast[:data]).to have_key(:type)
        expect(returned_forecast[:data][:type]).to eq('forecast')
        expect(returned_forecast[:data]).to have_key(:attributes)
        expect(returned_forecast[:data][:attributes]).to have_key(:current_forecast)
        expect(returned_forecast[:data][:attributes]).to have_key(:daily_forecast)
        expect(returned_forecast[:data][:attributes]).to have_key(:hourly_forecast)
      end
    end
  end
end
