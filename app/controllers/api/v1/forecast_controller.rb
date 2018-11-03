class Api::V1::ForecastController < ApiController
  def show
    # thing = ExternalApiService.new(params)
    @location = GoogleService.new(params[:location])
    # thing_to_render_in_json = thing.method_name
    coordinates = @location.coordinates
    # render json:  thing_to_render_in_json
    render json: coordinates
  end
end
