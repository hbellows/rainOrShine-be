require 'rails_helper'

describe 'User favorites a location' do
  context 'POST /api/v1/favorites' do
    it 'requires an api key to complete' do
      user = create(:user)

      payload = {
        location: 'Denver, CO',
        api_key:  user.api_key
      }

      post '/api/v1/favorites', params: payload

      returned_fave = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(returned_fave).to have_key(:data)
      expect(returned_fave[:data]).to have_key(:type)
      expect(returned_fave[:data]).to have_key(:attributes)
      expect(returned_fave[:data][:attributes]).to have_key(:location)
      expect(returned_fave[:data]).to have_key(:relationships)
      expect(returned_fave[:data][:relationships]).to have_key(:user)
    end

    it 'requires an api key to complete or will fail' do
      user = create(:user)

      payload = {
        location: 'Denver, CO'
      }

      post '/api/v1/favorites', params: payload

      expect(response.status).to eq(401)
    end

    it 'requires a location to complete or will fail' do
      user = create(:user)

      payload = {
        api_key:  user.api_key
      }

      post '/api/v1/favorites', params: payload

      expect(response.status).to eq(401)
    end
  end
end

describe 'User gets a list of favorite cities' do
  context 'GET /api/v1/favorites' do
    it 'returns cities and their current weather' do
      VCR.use_cassette('user_favorites') do
        user = create(:user)
        user.favorites.create(location: 'Denver, CO')
        user.favorites.create(location: 'Honolulu, HI')

        payload = {
          api_key: user.api_key
        }

        get '/api/v1/favorites', params: payload

        returned_fave = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(returned_fave).to have_key(:data)
        expect(returned_fave[:data]).to be_a(Array)
        expect(returned_fave[:data].size).to eq(2)
        expect(returned_fave[:data][0]).to have_key(:meta)
        expect(returned_fave[:data][0][:meta]).to have_key(:data)
        expect(returned_fave[:data][0][:meta][:data]).to have_key(:id)
        expect(returned_fave[:data][0][:meta][:data]).to have_key(:attributes)
        expect(returned_fave[:data][0][:meta][:data][:attributes]).to have_key(:current_forecast)
        expect(returned_fave[:data][1]).to have_key(:meta)
        expect(returned_fave[:data][1][:meta]).to have_key(:data)
        expect(returned_fave[:data][1][:meta][:data]).to have_key(:id)
        expect(returned_fave[:data][1][:meta][:data]).to have_key(:attributes)
        expect(returned_fave[:data][1][:meta][:data][:attributes]).to have_key(:current_forecast)
      end
    end

    it 'requires an api key to complete or will fail' do
      user = create(:user)
      user.favorites.create(location: 'Denver, CO')
      user.favorites.create(location: 'Honolulu, HI')

      payload = {
        location: 'Denver, CO'
      }

      get '/api/v1/favorites', params: payload

      expect(response.status).to eq(401)
    end
  end
end

describe 'User deletes a favorite location' do
  context 'DELETE /api/v1/favorites' do
    it 'removes that favorite' do
      VCR.use_cassette('delete_favorite_location') do
        user = create(:user)
        user.favorites.create(location: 'Denver, CO')
        user.favorites.create(location: 'Honolulu, HI')

        payload = {
          api_key:  user.api_key,
          location: 'Denver, CO'
        }

        delete '/api/v1/favorites', params: payload

        expect(response.status).to eq(204)

        # returned_fave = JSON.parse(response.body, symbolize_names: true)

        # expect(response).to be_successful
        # expect(returned_fave).to have_key(:data)
        # expect(returned_fave[:data]).to be_a(Array)
        # expect(returned_fave[:data].size).to eq(1)
        # expect(returned_fave[:data][0]).to have_key(:meta)
        # expect(returned_fave[:data][0][:meta]).to have_key(:data)
        # expect(returned_fave[:data][0][:meta][:data]).to have_key(:id)
        # expect(returned_fave[:data][0][:meta][:data]).to have_key(:attributes)
        # expect(returned_fave[:data][0][:meta][:data][:attributes]).to have_key(:current_forecast)
      end
    end

    it 'requires an api key to complete or will fail' do
      user = create(:user)
      user.favorites.create(location: 'Denver, CO')
      user.favorites.create(location: 'Honolulu, HI')

      payload = {
        location: 'Denver, CO'
      }

      delete '/api/v1/favorites', params: payload

      expect(response.status).to eq(401)
    end
  end
end