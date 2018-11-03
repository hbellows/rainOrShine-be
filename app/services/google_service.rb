class GoogleService
  def initialize(location)
    @location = location
  end

  def location_data
    get_json("/maps/api/geocode/json?address=#{@location}")
  end

  def coordinates
    location_data[:results][0][:geometry][:location]
  end
  
  private
  
  def conn
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.headers['Accept'] = 'application/json'
      faraday.params['key'] = ENV['google_api_key']
      faraday.adapter Faraday.default_adapter
    end
  end
  
  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
