describe GoogleGeocoderService do
  it 'exists' do
    service = GoogleGeocoderService.new

    expect(service).to be_a(GoogleGeocoderService)
  end

  context 'instance methods' do
    context '#location_data' do
      it 'returns a hash' do
        VCR.use_cassette('location_data') do
          service = GoogleGeocoderService.new
          response = service.location_data('denver,co')

          expect(response).to be_a(Hash)
          expect(response).to have_key(:results)
          expect(response[:results]).to be_a(Array)
          expect(response[:results][0][:geometry][:location]).to have_key(:lat)
          expect(response[:results][0][:geometry][:location]).to have_key(:lng)
        end
      end
    end
  end
end
