class FavoritesSerializer
  include FastJsonapi::ObjectSerializer
  attributes 

  meta do |favorite|
    weather = ForecastFinder.new(favorite.location)
    FavoriteWeatherLocationSerializer.new(weather)
  end
end
