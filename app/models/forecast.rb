class Forecast
  attr_reader :time_long, :time_short, :summary, :icon, :temp, :feels_like, :humidity, :uv_index

  def initialize(data)
    @time_long = Time.at(data[:time]).strftime('%I:%M %p')
    @time_short = Time.at(data[:time]).strftime('%I %p')
    @summary = data[:summary]
    @icon = data[:icon]
    @temp = data[:temperature].round
    @feels_like = data[:apparentTemperature].round
    @humidity = (data[:humidity] * 100).round
    @uv_index = data[:uvIndex]
  end
end