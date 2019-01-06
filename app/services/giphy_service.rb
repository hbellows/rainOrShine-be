class GiphyService

  def find_gifs(key_word)
    get_json("search?q=#{key_word}&limit=1&offset=0&rating=G&lang=en")
  end

  private

  def conn
    Faraday.new(url: 'https://api.giphy.com/v1/gifs') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.params['api_key'] = ENV['giphy_api_key']
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end