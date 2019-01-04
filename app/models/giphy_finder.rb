class GiphyFinder
include CoordinateFinder

  def initialize(location)
    @location = location
  end

  # def method_name
    
  # end

  private

  def daily_forecast
    weather_data[:daily][:data]
  end

  def weather_service
    @weather_service ||= DarkSkyWeatherService.new
  end

  def weather_data
    weather_service.find_forecast(latitude, longitude)
  end

  def giphy_data
    giphy_service.find_gifs(key_word)
  end

  def giphy_service
    @giphy_service ||= GiphyService.new
  end
end