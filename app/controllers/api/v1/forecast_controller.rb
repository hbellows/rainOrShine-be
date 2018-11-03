class Api::V1::ForecastController < ApiController

  def show
    @coordinates = GoogleService.new(params[:location])
    # thing = ExternalApiService.new(params)
    # thing_to_render_in_json = thing.method_name
    # render json:  thing_to_render_in_json
  end
end
