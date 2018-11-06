class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:upvote, :new, :create]

  def index
    @posts = Post.includes(:user, :comments).paginate(page: params[:page], per_page: 10).order(score: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def upvote
    @post = Post.find(params[:id])
    if current_user.upvoted?(@post)
      current_user.votes.find_by(voteable: @post).destroy
    else
      @vote = @post.votes.new(user: current_user, upvote: true)
      @vote.save
    end

    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:title, :link_url)
  end
end
