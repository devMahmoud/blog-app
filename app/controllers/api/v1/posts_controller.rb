class  Api::V1::PostsController < ApplicationController
  def index
    @user_posts = Post.where(author_id: params[:user_id]).order(created_at: :desc)
    render json: @user_posts
  end
end