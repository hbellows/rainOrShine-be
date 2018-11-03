describe GoogleService do
  it 'exists' do
    service = GoogleService.new('denver,co')

    expect(service).to be_a(GoogleService)
  end

  context 'instance methods' do
    context '#location_data' do
      it 'returns a hash' do 
        VCR.use_cassette('location_data') do
          service = GoogleService.new('denver,co')
          
          expect(service.location_data).to be_a(Hash)
          expect(service.location_data).to have_key(:results)
          expect(service.location_data[:results]).to be_a(Array)
          expect(service.location_data[:results][0][:geometry][:location]).to have_key(:lat)
          expect(service.location_data[:results][0][:geometry][:location]).to have_key(:lng)
        end
      end
    end
  end
end
