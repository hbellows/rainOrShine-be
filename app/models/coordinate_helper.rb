module CoordinateHelper

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