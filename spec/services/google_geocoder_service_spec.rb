require 'rails_helper'

describe GoogleGeocoderService do

  subject { GoogleGeocoderService.new }

  it 'exists' do
    expect(subject).to be_a(GoogleGeocoderService)
  end

  context 'Instance Methods' do
    it 'returns #location_data' do
      VCR.use_cassette('location_data') do
        response = subject.location_data('denver,co')

        expect(response).to be_a(Hash)
        expect(response).to have_key(:results)
        expect(response[:results]).to be_a(Array)
        expect(response[:results][0][:geometry][:location]).to have_key(:lat)
        expect(response[:results][0][:geometry][:location]).to have_key(:lng)
      end
    end
  end
end
