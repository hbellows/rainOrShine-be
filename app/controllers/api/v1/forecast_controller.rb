class Api::V1::ForecastController < ApiController

  def show
    forecast = Forecast.new(params[:location])
    render json: ForecastSerializer.new(forecast).serialized_json
  end
end
