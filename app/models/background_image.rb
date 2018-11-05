class BackgroundImage
  include CoordinateHelper

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
