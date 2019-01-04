class Api::V1::GifsController < ApiController

  def index
    render json: GiphySerializer.new(gifs)
  end

  private
  def gifs
    @gifs ||= GiphyFinder.new(params[:location])
  end

end