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
    @day = Time.local(data[:time]).strftime('%A')
    @time = Time.local(data[:time]).strftime('%I:%M %p')
    @sunrise = Time.local(data[:sunriseTime]).strftime('%I:%M %p')
    @sunset = Time.local(data[:sunsetTime]).strftime('%I:%M %p')
    @summary = data[:summary]
    @icon = data[:icon]
    @high = data[:temperatureHigh].round
    @low = data[:temperatureLow].round
    @precip_type = data[:precipType]
    @humidity = data[:humidity]
    @uv_index = data[:uvIndex]
  end
end