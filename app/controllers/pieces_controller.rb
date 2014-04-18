class PiecesController < ApplicationController

  def index
    @current_artist = current_artist
    @all_pieces = Piece.all
    
    if params[:artist_id].nil?
      #@artist = @current_artist
      @pieces = Piece.all
    else
      artist  = Artist.find(params[:artist_id])
      @pieces = artist.pieces
    end
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

  def destroy
    @piece = Piece.find(params[:id])
    @piece.destroy
 
    redirect_to pieces_path
  end
  
  def my_pieces
    @current_artist = current_artist
  end

private
  def piece_params
    params[:piece][:artist_id] = current_artist.id
    params.require(:piece).permit!
  end
end