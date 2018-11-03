class Api::V1::ForecastController < ApiController

  def show
    render json: forecast
  end
end