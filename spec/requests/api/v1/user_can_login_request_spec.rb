require 'rails_helper'

xdescribe 'POST request' do
  context 'user logs in' do
    it 'logs the user in with the provided email and password' do

      user_payload = {
        email: 'whatever@example.com',
        password: 'password'
      }

      post '/api/v1/sessions', params: user_payload

      expect(response.status).to eq(200)

      returned_json = JSON.parse(response.body, symbolize_names: true)

      expect(returned_json).to be_a(Hash)
      expect(returned_json).to have_key(:data)
      expect(returned_json[:data]).to have_key(:type)
      expect(returned_json[:data][:type]).to eq('session')
      expect(returned_json[:data]).to have_key(:attributes)
      expect(returned_json[:data][:attributes]).to have_key(:email)
      expect(returned_json[:data][:attributes][:email]).to be_a(String)
      expect(returned_json[:data][:attributes]).to have_key(:password)
      expect(returned_json[:data][:attributes][:password]).to be_a(String)
    end
  end
end