class ArtistsController < ApplicationController
  def index
    @current_artist = current_artist
    @artists = Artist.all
  end
  
  def create
    @artist = Artist.create!(artist_params)
    redirect_to artists_path, notice: "Hi #{@artist.name}. Welcome to ShareArt!"
  end
  
  def new
    @artist = Artist.new
  end
  
  private

  def artist_params
    params.require(:artist).permit!
  end
end