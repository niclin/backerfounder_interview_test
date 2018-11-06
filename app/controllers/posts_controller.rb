class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:upvote]

  def index
    @posts = Post.includes(:user, :comments).all
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
  end

  def upvote
    @post = Post.find(params[:id])

    if current_user.upvoted?(@post)
      current_user.votes.find_by(post: @post).destroy
    else
      @vote = @post.votes.new(user: current_user, upvote: true)
      @vote.save
    end

    redirect_back(fallback_location: root_path)
  end
end
