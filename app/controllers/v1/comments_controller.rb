class V1::CommentsController < ApplicationController

  before_action :set_comment_id, only: [:destroy, :update]
  def index
    @comments = current_post.comments.all
    render json: @comments, status: 200
  end

  def create
    @comment = current_post.comments.build(comment_params)
    if @comment.save!
      render :create
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    @comment.destroy
    render json: :comment_deleted, status: 204
  end

  def update
    if @comment.update(comment_params)
      render json: :comment_update, status: 200
    else
      render json: {error: "unprocessible_Entity"}, status: :unauthorized
    end
  end

  private
  def current_post
    @current_post ||= Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:id, :content, :post_id)
  end

  def set_comment_id
    @comment = Comment.find(params[:id])
  end

end
