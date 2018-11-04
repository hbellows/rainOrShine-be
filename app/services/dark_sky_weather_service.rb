class DarkSkyWeatherService

  def forecast_data(lat, lng, lang = 'en', exclude = 'minutely')
    get_json("/forecast/#{ENV['dark_sky_api_key']}/#{lat},#{lng}?lang=#{lang}&exclude=#{exclude}")
  end

  private

    def conn
      Faraday.new(url: 'https://api.darksky.net') do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_json(url)
      JSON.parse(conn.get(url).body, symbolize_names: true)
    end
end
