require 'rails_helper'

describe Forecast do

  user_location = 'denver,co'
  subject { Forecast.new(user_location) }

  it 'exists' do
    expect(subject).to be_a(Forecast)
  end

  context 'Instance Methods' do
    it 'returns #current_forecast' do
      VCR.use_cassette('current_forecast') do
        expect(subject.current_forecast).to be_a(Hash)
        expect(subject.current_forecast).to have_key(:time)
        expect(subject.current_forecast).to have_key(:summary)
        expect(subject.current_forecast).to have_key(:icon)
        expect(subject.current_forecast).to have_key(:nearestStormDistance)
        expect(subject.current_forecast).to have_key(:precipIntensity)
        expect(subject.current_forecast).to have_key(:precipProbability)
        expect(subject.current_forecast).to have_key(:temperature)
        expect(subject.current_forecast).to have_key(:apparentTemperature)
        expect(subject.current_forecast).to have_key(:dewPoint)
        expect(subject.current_forecast).to have_key(:humidity)
        expect(subject.current_forecast).to have_key(:pressure)
        expect(subject.current_forecast).to have_key(:windSpeed)
        expect(subject.current_forecast).to have_key(:windGust)
        expect(subject.current_forecast).to have_key(:windBearing)
        expect(subject.current_forecast).to have_key(:cloudCover)
        expect(subject.current_forecast).to have_key(:uvIndex)
        expect(subject.current_forecast).to have_key(:visibility)
        expect(subject.current_forecast).to have_key(:ozone)
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
        expect(subject.daily_forecast[0]).to be_a(Hash)
        expect(subject.daily_forecast[0]).to have_key(:time)
        expect(subject.daily_forecast[0]).to have_key(:summary)
        expect(subject.daily_forecast[0]).to have_key(:icon)
        expect(subject.daily_forecast[0]).to have_key(:sunriseTime)
        expect(subject.daily_forecast[0]).to have_key(:sunsetTime)
        expect(subject.daily_forecast[0]).to have_key(:moonPhase)
        expect(subject.daily_forecast[0]).to have_key(:precipIntensity)
        expect(subject.daily_forecast[0]).to have_key(:precipIntensityMax)
        expect(subject.daily_forecast[0]).to have_key(:precipIntensityMaxTime)
        expect(subject.daily_forecast[0]).to have_key(:precipProbability)
        expect(subject.daily_forecast[0]).to have_key(:temperatureHigh)
        expect(subject.daily_forecast[0]).to have_key(:temperatureHighTime)
        expect(subject.daily_forecast[0]).to have_key(:temperatureLow)
        expect(subject.daily_forecast[0]).to have_key(:temperatureLowTime)
        expect(subject.daily_forecast[0]).to have_key(:apparentTemperatureHigh)
        expect(subject.daily_forecast[0]).to have_key(:apparentTemperatureHighTime)
        expect(subject.daily_forecast[0]).to have_key(:apparentTemperatureLow)
        expect(subject.daily_forecast[0]).to have_key(:apparentTemperatureLowTime)
        expect(subject.daily_forecast[0]).to have_key(:dewPoint)
        expect(subject.daily_forecast[0]).to have_key(:humidity)
        expect(subject.daily_forecast[0]).to have_key(:pressure)
        expect(subject.daily_forecast[0]).to have_key(:windSpeed)
        expect(subject.daily_forecast[0]).to have_key(:windGust)
        expect(subject.daily_forecast[0]).to have_key(:windGustTime)
        expect(subject.daily_forecast[0]).to have_key(:windBearing)
        expect(subject.daily_forecast[0]).to have_key(:cloudCover)
        expect(subject.daily_forecast[0]).to have_key(:uvIndex)
        expect(subject.daily_forecast[0]).to have_key(:uvIndexTime)
        expect(subject.daily_forecast[0]).to have_key(:visibility)
        expect(subject.daily_forecast[0]).to have_key(:ozone)
        expect(subject.daily_forecast[0]).to have_key(:temperatureMin)
        expect(subject.daily_forecast[0]).to have_key(:temperatureMinTime)
        expect(subject.daily_forecast[0]).to have_key(:temperatureMax)
        expect(subject.daily_forecast[0]).to have_key(:temperatureMaxTime)
        expect(subject.daily_forecast[0]).to have_key(:apparentTemperatureMin)
        expect(subject.daily_forecast[0]).to have_key(:apparentTemperatureMinTime)
        expect(subject.daily_forecast[0]).to have_key(:apparentTemperatureMax)
        expect(subject.daily_forecast[0]).to have_key(:apparentTemperatureMaxTime)
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
        expect(subject.hourly_forecast[0]).to be_a(Hash)
        expect(subject.hourly_forecast[0]).to have_key(:time)
        expect(subject.hourly_forecast[0]).to have_key(:summary)
        expect(subject.hourly_forecast[0]).to have_key(:icon)
        expect(subject.hourly_forecast[0]).to have_key(:precipIntensity)
        expect(subject.hourly_forecast[0]).to have_key(:precipProbability)
        expect(subject.hourly_forecast[0]).to have_key(:temperature)
        expect(subject.hourly_forecast[0]).to have_key(:apparentTemperature)
        expect(subject.hourly_forecast[0]).to have_key(:dewPoint)
        expect(subject.hourly_forecast[0]).to have_key(:humidity)
        expect(subject.hourly_forecast[0]).to have_key(:pressure)
        expect(subject.hourly_forecast[0]).to have_key(:windSpeed)
        expect(subject.hourly_forecast[0]).to have_key(:windGust)
        expect(subject.hourly_forecast[0]).to have_key(:windBearing)
        expect(subject.hourly_forecast[0]).to have_key(:cloudCover)
        expect(subject.hourly_forecast[0]).to have_key(:uvIndex)
        expect(subject.hourly_forecast[0]).to have_key(:visibility)
        expect(subject.hourly_forecast[0]).to have_key(:ozone)
      end
    end
  end
end
