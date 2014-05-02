class PiecesController < ApplicationController

  def index
    @current_artist = current_artist
    @all_pieces = Piece.all
    @counter = 0
    
    
    if params[:artist_id].nil?
      @pieces = Piece.all
      @artist = Artist.find(current_artist.id)
    else
      @artist  = Artist.find(params[:artist_id])
      @pieces = @artist.pieces
    end
  end
  
  def show
    @current_artist = current_artist
    @piece = Piece.find(params[:id])
    @comments = @piece.comments
  end
  
  def create
    @current_artist = current_artist
    @piece = Piece.create!(piece_params)
    #redirect_to pieces_path, notice: "#{@piece.piece_name} successfully added!"
    redirect_to artist_pieces_path(current_artist), notice: "#{@piece.piece_name} successfully added!"
  end
  
  def new
    @current_artist = current_artist
    @piece = Piece.new
  end
  
  def edit
    @current_artist = current_artist
    @piece = Piece.find(params[:id])
  end

  def update
    @piece = Piece.find(params[:id])
    @piece.update_attributes!(piece_params)
    redirect_to artist_pieces_path(current_artist), notice: "Successfully updated your piece!"
  end

  def destroy
    @piece = Piece.find(params[:id])
    @piece.destroy
 
    redirect_to artist_pieces_path(current_artist), notice: "#{@piece.piece_name} successfully deleted!"
  end

private
  def piece_params
    params[:piece][:artist_id] = current_artist.id
    params.require(:piece).permit!
  end
end