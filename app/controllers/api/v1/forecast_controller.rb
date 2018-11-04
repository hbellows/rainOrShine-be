class Api::V1::ForecastController < ApiController
  def show
     render json: forecast
  end

  private 
    def find_forecast 
      Forecast.new(params[:location])
    end

    def forecast
      ForecastSerializer.new(find_forecast).serialized_json
    end
end


# NOTES:
  # def show
  #   # thing = ExternalApiService.new(params)
  #   @location = google_service.location_data(params[:location])
  #   # thing_to_render_in_json = thing.method_name
  #   lat = @location.latitude
  #   lng = @location.longitude
  #   # render json:  thing_to_render_in_json
  #   render json: weather_data
  # end