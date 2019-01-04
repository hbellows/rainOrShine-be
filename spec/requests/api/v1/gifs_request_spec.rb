require 'rails_helper'

describe 'Gifs Endpoint' do
  context 'GET request' do
    it 'returns json with eight day forecast time, summary, and giphy url' do
      VCR.use_cassette('get_gifs') do
        user_location = 'denver,co'
        get "/api/v1/gifs?location=#{user_location}"

        expect(response.status).to eq(200)

        returned_json = JSON.parse(response.body, symbolize_names: true)

        expect(returned_json).to be_a(Hash)
        expect(returned_json).to have_key(:data) 
        expect(returned_json[:data]).to have_key(:id)
        expect(returned_json[:data][:id]).to eq(user_location)
        expect(returned_json[:data]).to have_key(:type)
        expect(returned_json[:data][:type]).to eq('giphy')
        expect(returned_json[:data]).to have_key(:attributes)
        expect(returned_json[:data][:attributes]).to have_key(:giphy_forecast)
        expect(returned_json[:data][:attributes][:giphy_forecast]).to have_key(:data)
        expect(returned_json[:data][:attributes][:giphy_forecast][:data]).to have_key(:daily_forecasts)
        expect(returned_json[:data][:attributes][:giphy_forecast][:data][:daily_forecasts]).to be_a(Array)
        expect(returned_json[:data][:attributes][:giphy_forecast][:data][:daily_forecasts][0]).to have_key(:time)
        expect(returned_json[:data][:attributes][:giphy_forecast][:data][:daily_forecasts][0]).to have_key(:summary)
        expect(returned_json[:data][:attributes][:giphy_forecast][:data][:daily_forecasts][0]).to have_key(:url)
        expect(returned_json[:data][:attributes][:giphy_forecast]).to have_key(:copyright)
      end
    end
  end
end

# **High level:**

# Build an API endpoint that returns links to animated GIFs based on the weather for each day for the next 8 days.

# **Details:**

# Your endpoint should accept a GET requests like this:  `/api/v1/gifs?location=denver,co`

# You will use the summary returned in the response from the Dark Sky API nested under the `daily` portion of the response. This response returns 8 days by default. Return a GIF based on the `summary` for each day.

# GIFs will be returned from GIPHY using the `Search` endpoint for the `GIPHY Public API`.

# If your Dark Sky API call is not working yet, you can use the fake response from the API at the bottom of this page.

# Your response should look something like this (but it doesn't need to be exact. We need the time, summary, and GIPHY URL for each day). If you are most comfortable using Fast JSON your structure may vary. Don't forget you can call `.to_json` on any Ruby object (e.g. a PORO) and each `attr_reader` will show up in the generated JSON as the name in the name/value pair.

# ```
# {
#   data: {
#     daily_forecasts: [
#       {
#         time: "1546498800",
#         summary: "Mostly sunny in the morning.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1546585200",
#         summary: "Partly cloudy in the evening.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1546671600",
#         summary: "Snowy.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1546758000",
#         summary: "Firenado",
#         url: "<GIPHY_URL_GOES_HERE>"
#       },
#       {
#         time: "1546844400",
#         summary: "Corgis because I cant think of other weather",
#         url: "<GIPHY_URL_GOES_HERE>"
#       }
#     ]     
#   }
#   copyright: "2018"
# }
# ```
