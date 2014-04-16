class PiecesController < ApplicationController

  def index
    @current_artist = current_artist
    @all_pieces = Piece.all
    #@pieces = Artist.find(params[:artist_id]).pieces
  end
  
  def create
    @current_artist = current_artist
    @piece = Piece.create!(piece_params)
    redirect_to pieces_path, notice: "#{@piece.piece_name} successfully added!"
  end
  
  def new
    @current_artist = current_artist
    @piece = Piece.new
  end
end

private

  def piece_params
    params.require(:piece).permit!
  end