require 'rails_helper'

describe GiphyService do

  subject { GiphyService.new }

  it 'exists' do
    expect(subject).to be_a(GiphyService)
  end

  context '#Instance Methods' do
    it 'returns #forecast_data' do
      VCR.use_cassette('giphy_data') do
        response = subject.find_gifs('partly-cloudy')

        expect(response).to be_a(Hash)
        expect(response).to have_key(:data)
        expect(response[:data]).to be_a(Array)
        expect(response[:data][0]).to have_key(:type)
        expect(response[:data][0]).to have_key(:id)
        expect(response[:data][0]).to have_key(:url)
        expect(response[:data][0][:url]).to be_a(String)
      end
    end
  end
end