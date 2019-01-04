class Forecast
  attr_reader :time, :summary, :icon, :temp, :feels_like, :humidity, :uv_index

  def initialize(data)
    binding.pry
    @time = data[:time]
    @summary = data[:summary]
    @icon = data[:icon]
    @temp = data[:temperature]
    # @feels_like = data[:]
    @humidity = data[:humidity]
    @uv_index = data[:uvIndex]
  end
end