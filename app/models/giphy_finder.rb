class GiphyFinder
include CoordinateFinder

  attr_reader :location

  def initialize(location)
    @location = location
  end

  def giphy_forecast_json
    {
      data: {
        daily_forecasts: forecast_gifs
      },
      copyright: "2018"
    }
    
  end

  def forecast_gifs
    eight_day_forecast.each_with_object([]) do |day, data|
      data << GiphyForecast.new({time: day[:time], summary: day[:summary] , url: giphy_data(day[:icon])}).data
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
