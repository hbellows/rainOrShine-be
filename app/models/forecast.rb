class Forecast
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def image_collection
    find_images[:photos][:photo]
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

  def image_service
    @image_service ||= FlickrImageService.new
  end

  def find_images
    image_service.image_data(latitude, longitude)
  end

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
