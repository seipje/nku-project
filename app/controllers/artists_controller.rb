class ArtistsController < ActionController::Base
  def index
  end
  
  def create
    @artist = Artist.create!(artist_params)
  end
  
  def new
    @artist = Artist.new
  end
  
  private

  def artist_params
    params.require(:artist).permit!
  end
end