class ForecastFinder
  include CoordinateHelper
  
  attr_reader :location

  # rails c
  # gifs = Gifs.new('denver,co')
  # gifs.image_data

  def initialize(location)
    @location = location
  end

  def current_forecast
    Forecast.new(weather_data[:currently])
  end

  def daily_forecast_summary
    weather_data[:daily]
  end

  def daily_forecast
    weather_data[:daily][:data]
  end

  def hourly_forecast_summary
    weather_data[:hourly]
  end

  def hourly_forecast
    weather_data[:hourly][:data]
  end

  private

  def weather_service
    @weather_service ||= DarkSkyWeatherService.new
  end

  def weather_data
    weather_service.find_forecast(latitude, longitude)
  end
end
