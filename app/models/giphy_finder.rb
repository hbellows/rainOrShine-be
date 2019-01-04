class GiphyFinder
include CoordinateFinder

  def initialize(location)
    @location = location
  end

  def giphy_forecast_builder
    eight_day_forecast.map do |day|
      GiphyForecast.new({day[:time], day[:summary], giphy_data(day[:icon])})
    end
  end

  private

  def eight_day_forecast
    weather_data[:daily][:data]
  end

  def weather_service
    @weather_service ||= DarkSkyWeatherService.new
  end

  def weather_data
    weather_service.find_forecast(latitude, longitude)
  end

  def giphy_data(key_word)
    giphy_service.find_gifs(key_word)[:data][0][:url]
  end

  def giphy_service
    @giphy_service ||= GiphyService.new
  end
end