class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comments_params)
    @comment.user = current_user

    if @comment.save
    else
      redirect_to root_path
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body)
  end
end
