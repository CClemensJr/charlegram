class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "You commented successfully!"
      redirect_to :back
    else
      flash[:alert] = "Your comment was thwarted. Please check the comment form."
      render root_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy
    flash[:success] = "Your comment was successfully deleted!"
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comments).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
