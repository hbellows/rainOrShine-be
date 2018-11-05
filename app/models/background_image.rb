class BackgroundImage
  include CoordinateHelper

  attr_reader :location

  def initialize(location)
    @location = location
  end

  def image_collection
    find_images[:photos][:photo]
  end

  private

  def image_service
    @image_service ||= FlickrImageService.new
  end

  def find_images
    image_service.image_data(latitude, longitude)
  end
end
