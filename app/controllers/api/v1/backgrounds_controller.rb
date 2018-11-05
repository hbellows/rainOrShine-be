class Api::V1::BackgroundsController < ApiController

  def index
    backgrounds = Forecast.new(params[:location])
    render json: BackgroundImagesSerializer.new(backgrounds).serialized_json
  end
end
