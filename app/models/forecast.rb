class Forecast
  def initialize(location)
    @location = location
  end

  private

  def weather_service
    @weather_service ||= DarkSkyWeatherService.new
  end

  def find_weather
    weather_service.forecast_data(latitude, longitude)
  end

  def geocoder_service
    @geocoder_service ||= GoogleGeocoderService.new
  end

  def find_location
    geocoder_service.location_data(@location)
  end

  def coordinates
    find_location[:results][0][:geometry][:location]
  end

  def latitude
    coordinates[:lat]
  end

  def longitude
    coordinates[:lng]
  end
end
