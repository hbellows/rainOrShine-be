class Forecast
  attr_reader :time, :summary, :icon, :temp, :feels_like, :humidity, :uv_index

  def initialize(data)
    binding.pry
    @time = Time.at(data[:time]).strftime('%I:%M')
    @summary = data[:summary]
    @icon = data[:icon]
    @temp = data[:temperature]
    @feels_like = data[:apparentTemperature]
    @humidity = data[:humidity]
    @uv_index = data[:uvIndex]
  end
end