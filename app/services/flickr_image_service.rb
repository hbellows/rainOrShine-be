class FlickrImageService

  def image_data(latitude, longitude)
    get_json("/services/rest/?method=flickr.photos.search&lat=#{latitude}&lon=#{longitude}&per_page=20&page=1")
  end

  private

  def conn
    Faraday.new(url: 'https://api.flickr.com') do |faraday|
      faraday.params['api_key'] = ENV['flickr_api_key']
      faraday.params['format'] = 'json'
      faraday.params['nojsoncallback'] = '1'
      faraday.params['tags'] = 'park'
      faraday.params['privacy_filter'] = 'public'
      faraday.params['content_type'] = '1'
      faraday.params['extras'] = 'url_o'
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
