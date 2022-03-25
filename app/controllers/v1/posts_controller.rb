class V1::PostsController < ApplicationController

	require 'rest-client'
  def index
  	@posts = Post.all
		render json: @posts, status: 200
		# response = RestClient.get "http://localhost:3000/v1/posts"
  end


  def create
		@post = Post.new(post_params)
		if @post.save!
			render :create
		else
			head(:unprocessable_entity)
		end
  end

  private
  def post_params
    params.require(:post).permit(:id, :title, :description, :file)
  end

end
