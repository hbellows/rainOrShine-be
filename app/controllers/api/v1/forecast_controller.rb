class Api::V1::ForecastController < ApiController

  def show
    render json: ForecastSerializer.new(forecast).serialized_json
  end

  private

  def forecast
    @forecast ||= ForecastFinder.new(params[:location])
  end
end