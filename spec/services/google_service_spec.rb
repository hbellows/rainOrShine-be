describe GoogleService do
  it 'exists' do
    service = GoogleService.new

    expect(service).to be_a(GoogleService)
  end

  context 'instance methods' do
    context '#location_data' do
      it 'returns a hash' do
        VCR.use_cassette('location_data') do
          service = GoogleService.new
          response = service.location_data('denver,co')

          expect(response).to be_a(Hash)
          expect(response).to have_key(:results)
          expect(response[:results]).to be_a(Array)
          expect(response[:results][0][:geometry][:location]).to have_key(:lat)
          expect(response[:results][0][:geometry][:location]).to have_key(:lng)
        end
      end
    end

    context '#latitude and #longitude' do
      it 'returns latitude and longitude' do
        VCR.use_cassette('lat_and_lng') do
          service = GoogleService.new
          response = service.location_data('denver,co')

          expect(response[:results][0][:geometry][:location][:lat]).to eq(39.7392358)
          expect(response[:results][0][:geometry][:location][:lng]).to eq(-104.990251)
        end
      end
    end
  end
end
