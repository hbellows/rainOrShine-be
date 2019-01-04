class Api::V1::ForecastController < ApiController

  def index
    render json: GiphySerializer.new(gifs)
  end

  private
  def gifs
    @gifs ||= GiphyFinder.new(param[:location])
  end

end