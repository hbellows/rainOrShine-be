class Api::V1::BackgroundsController < ApiController
  before_action :backgrounds

  def index
    render json: BackgroundImageSerializer.new(backgrounds).serialized_json
  end

  private

  def backgrounds
    @backgrounds ||= BackgroundImage.new(params[:location])
  end
end
