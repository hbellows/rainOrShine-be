class FavoriteWeatherLocationSerializer
  include FastJsonapi::ObjectSerializer
  set_id :location

  attributes :current_forecast 
end
