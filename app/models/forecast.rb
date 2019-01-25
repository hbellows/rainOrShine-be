class Forecast
  attr_reader :time, :summary, :icon, :temp, :high, :low, :feels_like, :humidity, :uv_index

  def initialize(data)
    @data = data
    @time = Time.at(data[:time]).strftime('%I:%M %p')
    @summary = data[:summary]
    @icon = data[:icon]
    # @temp = data[:temperature].round
    # @high = data[:temperatureHigh].round
    # @low = data[:temperatureLow].round
    # @feels_like = data[:apparentTemperature].round
    @humidity = data[:humidity]
    @uv_index = data[:uvIndex]
  end

  def high
    if @data.has_key?(:temperatureHigh)
      @data[:temperatureHigh].round
    end
  end

  def low
    if @data.has_key?(:temperatureLow)
      @data[:temperatureLow].round
    end
  end

  def temp
    if @data.has_key?(:temperature)
      @data[:temperature].round
    end
  end

  def feels_like
    if @data.has_key?(:apparentTemperature)
      @data[:apparentTemperature].round
    end
  end
end