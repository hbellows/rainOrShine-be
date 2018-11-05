class Api::V1::BackgroundsController < ApiController

  def index
    backgrounds = BackgroundImage.new(params[:location])
    render json: BackgroundImageSerializer.new(backgrounds).serialized_json
  end
end
