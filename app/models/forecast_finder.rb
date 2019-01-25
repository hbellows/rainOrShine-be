class ForecastFinder
  include CoordinateFinder
  
  attr_reader :location

  def initialize(location)
    @location = location.strip.downcase
  end

  def current_forecast
    Forecast.new(weather_data[:currently])
  end

  def daily_forecast_summary
    weather_data[:daily]
  end

  def daily_forecast
    weather_data[:daily][:data].map do |forecast_data|
      Forecast.new(forecast_data)
    end
  end

  def hourly_forecast_summary
    weather_data[:hourly]
  end

  def hourly_forecast
    weather_data[:hourly][:data].map do |forecast_data|
      Forecast.new(forecast_data)
    end
  end

  private

  def weather_service
    @weather_service ||= DarkSkyWeatherService.new
  end

  def weather_data
    weather_service.find_forecast(latitude, longitude)
  end
end
