class ForecastSerializer 
  include FastJsonapi::ObjectSerializer
  
  set_type :forecast
  set_id :location

  attributes :current_forecast, :daily_forecast_summary, :daily_forecast,
             :hourly_forecast_summary, :hourly_forecast
end
