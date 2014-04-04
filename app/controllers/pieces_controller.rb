class PiecesController < ApplicationController

  def index
    @current_artist = current_artist
    #@pieces = Artist.find(params[:artist_id]).pieces
  end
end