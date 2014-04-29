class ArtistsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def index
    @current_artist = current_artist
    @artists = Artist.all
  end
  
  def create
    @artist = Artist.create!(artist_params)
    session[:artist_id] = @artist.id
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