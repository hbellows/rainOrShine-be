class Forecast
  attr_reader :time, :summary, :icon, :temp, :feels_like, :humidity, :uv_index

  def initialize(data)
    @time = Time.at(data[:time]).strftime('%I:%M %p')
    @summary = data[:summary]
    @icon = data[:icon]
    @temp = data[:temperature].round
    @feels_like = data[:apparentTemperature].round
    @humidity = data[:humidity]
    @uv_index = data[:uvIndex]
  end
end