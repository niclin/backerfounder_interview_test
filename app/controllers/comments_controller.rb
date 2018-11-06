class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @parent_comment = Comment.find(params[:parent_id])
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    @post = Post.find(params[:post_id])

    if parent_id_exists?
      parent = Comment.find_by_id(params[:comment][:parent_id])
      @comment = parent.children.build(comment_params)
      @comment.post = @post
    else
      @comment = @post.comments.new(comment_params)
    end

    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to root_path
    end
  end

  def upvote
    @comment = Comment.find(params[:id])
    if current_user.upvoted?(@comment)
      current_user.votes.find_by(voteable: @comment).destroy
    else
      @vote = @comment.votes.new(user: current_user, upvote: true)
      @vote.save
    end

    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def parent_id_exists?
    params[:comment][:parent_id].to_i > 0
  end
end
