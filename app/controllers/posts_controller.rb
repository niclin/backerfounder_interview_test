class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user, :comments).all
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
  end
end
