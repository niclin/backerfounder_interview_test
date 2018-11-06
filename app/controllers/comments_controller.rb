class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @parent_comment = Comment.find(params[:parent_id])
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    @post = Post.find(params[:post_id])

    if parent_id_exists?
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
      @comment.post = @post
    else
      @comment = @post.comments.new(comment_params)
    end

    @comment.user = current_user

    if @comment.save
      redirect_back(fallback_location: root_path, notice: 'Your comment was successfully added!')
    else
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def parent_id_exists?
    params[:comment][:parent_id].to_i > 0
  end
end
