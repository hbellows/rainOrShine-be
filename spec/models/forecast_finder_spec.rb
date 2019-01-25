require 'rails_helper'

describe ForecastFinder do

  user_location = 'denver,co'
  subject { ForecastFinder.new(user_location) }

  it 'exists' do
    expect(subject).to be_a(ForecastFinder)
  end

  context 'Instance Methods' do
    it 'returns #current_forecast' do
      VCR.use_cassette('current_forecast') do
        binding.pry
        expect(subject.current_forecast.time).to be_a(String)
        expect(subject.current_forecast.summary).to be_a(String)
        expect(subject.current_forecast.icon).to be_a(String)
        expect(subject.current_forecast.temp).to be_a(Integer)
        expect(subject.current_forecast.feels_like).to be_a(Integer)
        expect(subject.current_forecast.humidity).to be_a(Float)
        expect(subject.current_forecast.uv_index).to be_a(Integer)
      end
    end

    it 'returns #daily_forecast_summary' do
      VCR.use_cassette('daily_forecast_summary') do
        expect(subject.daily_forecast_summary).to be_a(Hash)
        expect(subject.daily_forecast_summary).to have_key(:summary)
        expect(subject.daily_forecast_summary).to have_key(:icon)
        expect(subject.daily_forecast_summary).to have_key(:data)
      end
    end

    it 'returns #daily_forecast' do
      VCR.use_cassette('daily_forecast') do
        expect(subject.daily_forecast[0].time).to be_a(String)
        expect(subject.daily_forecast[0].sunrise).to be_a(String)
        expect(subject.daily_forecast[0].sunset).to be_a(String)
        expect(subject.daily_forecast[0].summary).to be_a(String)
        expect(subject.daily_forecast[0].icon).to be_a(String)
        expect(subject.daily_forecast[0].high).to be_a(Integer)
        expect(subject.daily_forecast[0].low).to be_a(Integer)
        expect(subject.daily_forecast[0].humidity).to be_a(Float)
        expect(subject.daily_forecast[0].precip_type).to be_a(String)
        expect(subject.daily_forecast[0].uv_index).to be_a(Integer)
      end
    end

    it 'returns #hourly_forecast_summary' do
      VCR.use_cassette('hourly_forecast_summary') do
        expect(subject.hourly_forecast_summary).to be_a(Hash)
        expect(subject.hourly_forecast_summary).to have_key(:summary)
        expect(subject.hourly_forecast_summary).to have_key(:icon)
        expect(subject.hourly_forecast_summary).to have_key(:data)
      end
    end

    it 'returns #hourly_forecast' do
      VCR.use_cassette('hourly_forecast') do
        expect(subject.hourly_forecast[0].time).to be_a(String)
        expect(subject.hourly_forecast[0].summary).to be_a(String)
        expect(subject.hourly_forecast[0].icon).to be_a(String)
        expect(subject.hourly_forecast[0].temp).to be_a(Integer)
        expect(subject.hourly_forecast[0].feels_like).to be_a(Integer)
        expect(subject.hourly_forecast[0].humidity).to be_a(Float)
        expect(subject.hourly_forecast[0].uv_index).to be_a(Integer)
      end
    end
  end
end
