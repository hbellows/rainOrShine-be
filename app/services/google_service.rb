class GoogleService

  def location_data(location)
    get_json("/maps/api/geocode/json?address=#{location}")
  end

  def coordinates
    location_data[:results][0][:geometry][:location]
  end

  def latitude
    coordinates[:lat]
  end

  def longitude
    coordinates[:lng]
  end
  
  private
  
  def conn
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['google_api_key']
      faraday.adapter Faraday.default_adapter
    end
  end
  
  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
