class Forecast
  attr_reader :time, :summary, :icon, :temp, :feels_like, :humidity, :uv_index
  
  def initialize(data)
    @time = data[:]
    @summary = data[:]
    @icon = data[:]
    @temp = data[:]
    @feels_like = data[:]
    @humidity = data[:]
    @uv_index = data[:]
  end
end