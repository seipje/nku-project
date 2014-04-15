class PiecesController < ApplicationController

  def index
    @current_artist = current_artist
    #@pieces = Artist.find(params[:artist_id]).pieces
  end
  
  def create
    @current_artist = current_artist
    @piece = Piece.create!(piece_params)
    redirect_to artist_pieces_path, notice: "#{@piece.name} successfully added!"
  end
  
  def new
    @piece = Piece.new
  end
end

private

  def piece_params
    params.require(:piece).permit!
  end