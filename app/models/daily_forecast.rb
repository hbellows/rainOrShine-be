class DailyForecast
  attr_reader :day, 
              :time, 
              :sunrise, 
              :sunset, 
              :summary, 
              :icon, 
              :high, 
              :low, 
              :precip_type, 
              :humidity, 
              :uv_index

  def initialize(data)
    @day = Time.at(data[:time]).strftime('%A')
    @time = Time.at(data[:time]).strftime('%I:%M %p')
    @sunrise = Time.at(data[:sunriseTime]).strftime('%I:%M %p')
    @sunset = Time.at(data[:sunsetTime]).strftime('%I:%M %p')
    @summary = data[:summary]
    @icon = data[:icon]
    @high = data[:temperatureHigh].round
    @low = data[:temperatureLow].round
    @precip_type = data[:precipType]
    @humidity = (data[:humidity] * 100).round
    @uv_index = data[:uvIndex]
  end
end