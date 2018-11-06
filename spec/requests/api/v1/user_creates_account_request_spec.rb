require 'rails_helper'

describe 'POST request' do
  context 'guest visits api/v1/users' do
    it 'creates new account and returns api key' do

      user_payload = {
        email: 'whatever@example.com',
        password: 'password',
        password_confirmation: 'password'
      }

      post '/api/v1/users', params: user_payload

      expect(response.status).to eq(201)

      returned_json = JSON.parse(response.body, symbolize_names: true)

      expect(returned_json).to be_a(Hash)
      expect(returned_json).to have_key(:data)
      expect(returned_json[:data]).to have_key(:type)
      expect(returned_json[:data][:type]).to eq('user')
      expect(returned_json[:data]).to have_key(:attributes)
      expect(returned_json[:data][:attributes]).to have_key(:api_key)
      expect(returned_json[:data][:attributes][:api_key]).to be_a(String)
      expect(returned_json[:data][:attributes][:api_key].length).to eq(22)
    end
  end
end
