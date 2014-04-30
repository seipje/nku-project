class CommentsController < ApplicationController
  def create
    @piece = Post.find(params[:post_id])
    @comment = @piece.comments.create(params[:comment].permit(:commenter, :body))
    redirect_to post_path(@piece)
  end
  
  def new
  end

  #def destroy
  #  @piece = Post.find(params[:post_id])
  #  @comment = @post.comments.find(params[:id])
  #  @comment.destroy
  #  redirect_to post_path(@post)
  #end
end
