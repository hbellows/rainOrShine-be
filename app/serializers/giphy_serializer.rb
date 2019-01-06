class GiphySerializer
  include FastJsonapi::ObjectSerializer

  set_id :location
  attributes :giphy_forecast
end
