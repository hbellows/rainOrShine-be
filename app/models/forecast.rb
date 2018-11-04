class Forecast
  def initialize(location)
    @location = location
  end

  private

  def geocoder_service
    @geocoder_service ||= GoogleGeocoderService.new
  end

  def get_location
    geocoder_service.location_data(@location)
  end

  def coordinates
    get_location[:results][0][:geometry][:location]
  end

  def latitude
    coordinates[:lat]
  end

  def longitude
    coordinates[:lng]
  end
end
