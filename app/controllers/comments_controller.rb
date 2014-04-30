class CommentsController < ApplicationController
  def create
    @piece = Piece.find(params[:piece_id])
    @comment = @piece.comments.create(comment_params)
    redirect_to piece_path(@piece)
  end
  
  def new
    @current_artist = current_artist
    @piece = Piece.find(params[:piece_id])
    @comment = @piece.comments.new
  end

  #def destroy
  #  @piece = Post.find(params[:post_id])
  #  @comment = @post.comments.find(params[:id])
  #  @comment.destroy
  #  redirect_to post_path(@post)
  #end
  
  private
  def comment_params
    params[:comment][:piece_id] = @piece.id
    params[:comment][:artist_id] = current_artist.id
    params.require(:comment).permit!
  end
end
