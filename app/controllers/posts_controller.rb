class PostsController < ApplicationController
  #load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:author)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:author)
    @user = current_user
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.save
    redirect_to user_posts_path(current_user)
  end

  def destroy
    Post.destroy params[:id]
    redirect_to user_posts_url(user_id: params[:user_id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
