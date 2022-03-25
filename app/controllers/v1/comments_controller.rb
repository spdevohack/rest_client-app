class V1::CommentsController < ApplicationController
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

  private
  def current_post
    @current_post ||= Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:id, :content, :post_id)
  end

end
