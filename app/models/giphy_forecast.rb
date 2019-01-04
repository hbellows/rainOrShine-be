class GiphyForecast
  attr_reader :time, :summary, :url

  def initialize(data)
    binding.pry
    @time = data[:time]
    @summary = data[:summary]
    @url = data[:url]
  end
end