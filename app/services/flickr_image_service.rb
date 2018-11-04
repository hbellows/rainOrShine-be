class FlickrImageService

  def image_data(latitude, longitude)
    get_json("/services/rest/?lat=#{latitude}&lon=#{longitude}")
  end

  private

  def conn
    Faraday.new(url: 'https://api.flickr.com') do |faraday|
      faraday.params['method'] = 'flickr.photos.search'
      faraday.params['api_key'] = ENV['flickr_api_key']
      faraday.params['format'] = 'json'
      faraday.params['nojsoncallback'] = '1'
      faraday.params['tags'] = 'building'
      faraday.params['privacy_filter'] = 'public'
      faraday.params['content_type'] = '1'
      faraday.params['extras'] = 'url_o'
      faraday.params['per_page'] = '10'
      faraday.params['page'] = '1'
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end