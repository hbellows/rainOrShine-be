require 'rails_helper'

describe BackgroundImage do
  subject { BackgroundImage.new('denver,co') }
  
  it 'exists' do
    expect(subject).to be_a(BackgroundImage)
  end

  it 'returns #image_collection' do
    VCR.use_cassette('image_collection') do
      expect(subject.image_collection).to be_a(Array)
      expect(subject.image_collection.count).to eq(10)
      expect(subject.image_collection[0]).to have_key(:id)
      expect(subject.image_collection[0]).to have_key(:owner)
      expect(subject.image_collection[0]).to have_key(:server)
      expect(subject.image_collection[0]).to have_key(:title)
    end
  end
end