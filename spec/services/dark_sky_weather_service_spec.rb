describe DarkSkyWeatherService do

  subject { DarkSkyWeatherService.new }

  it 'exists' do
    expect(subject).to be_a(DarkSkyWeatherService)
  end

  context '#Instance Methods' do
    it 'returns #forecast_data' do
      VCR.use_cassette('forecast_data') do
        response = subject.find_forecast(39.7392358, -104.990251)

        expect(response).to be_a(Hash)
        expect(response).to have_key(:currently)
        expect(response).to have_key(:hourly)
        expect(response).to have_key(:daily)
      end
    end
  end
end
