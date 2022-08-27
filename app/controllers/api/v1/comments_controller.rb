class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @post_comments = Post.find(params[:post_id]).comments
    render json: @post_comments
  end

  def create
    @comment = Comment.new(text: comment_params[:text], author_id: current_user.id, post_id: params[:post_id])
    if @comment.save
      render json: { comment: @comment }, status: :created
    else
      render json: { errors: @comment.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
