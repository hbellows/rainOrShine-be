class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  set_id :location
  set_type :forecast

  attributes :current_forecast, :daily_forecast_summary, :daily_forecast,
             :hourly_forecast_summary, :hourly_forecast
end