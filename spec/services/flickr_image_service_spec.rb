require 'rails_helper'

describe FlickrImageService do

  subject { FlickrImageService.new }

  it 'exists' do
    expect(subject).to be_a(FlickrImageService)
  end

  context 'Instance Methods' do
    it 'returns #image_data' do
      VCR.use_cassette('image_data') do
        response = subject.image_data(39.7392358, -104.990251)

        expect(response).to be_a(Hash)
        expect(response).to have_key(:photos)
        expect(response[:photos]).to have_key(:photo)
        expect(response[:photos][:photo]).to be_a(Array)
        expect(response[:photos][:photo].count).to eq(10)
        expect(response[:photos][:photo][0]).to have_key(:id)
        expect(response[:photos][:photo][0]).to have_key(:owner)
        expect(response[:photos][:photo][0]).to have_key(:server)
        expect(response[:photos][:photo][0]).to have_key(:title)
      end
    end
  end
end
