class DailyForecast
  attr_reader :time, :sunrise, :sunset, :summary, :icon, :high, :low, :precip_type, :humidity, :uv_index

  def initialize(data)
    @time = Time.at(data[:time]).strftime('%I:%M %p')
    @sunrise = Time.at(data[:sunriseTime]).strftime('%I:%M %p')
    @sunset = Time.at(data[:sunsetTime]).strftime('%I:%M %p')
    @summary = data[:summary]
    @icon = data[:icon]
    @high = data[:temperatureHigh].round
    @low = data[:temperatureLow].round
    @precip_type = data[:precipType]
    @humidity = data[:humidity]
    @uv_index = data[:uvIndex]
  end
end