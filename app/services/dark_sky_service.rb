class DarkSkyService
  def current_forecast(lat, lng, lang = en, exclude = minutely)
    get_json("/ENV['dark_sky_api_key']/#{lat},#{lng}?#{lang}&#{exclude}")
  end

  private

    def conn
      Faraday.new(url: 'https://api.darksky.net/forecast') do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end
    
    def get_json(url)
      JSON.parse(conn.get(url).body, symbolize_names: true)
    end
end
