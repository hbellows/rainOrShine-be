class Forecast
  include CoordinateHelper
  
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def current_forecast
    find_weather[:currently]
  end

  def daily_forecast_summary
    find_weather[:daily]
  end

  def daily_forecast
    find_weather[:daily][:data]
  end

  def hourly_forecast_summary
    find_weather[:hourly]
  end

  def hourly_forecast
    find_weather[:hourly][:data]
  end

  private

  def weather_service
    @weather_service ||= DarkSkyWeatherService.new
  end

  def find_weather
    weather_service.forecast_data(latitude, longitude)
  end
end
