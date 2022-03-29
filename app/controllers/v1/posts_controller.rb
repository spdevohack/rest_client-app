class V1::PostsController < ApplicationController

	before_action :set_id, only: [:destroy, :update]

	require 'rest-client'
	require 'json'

  def index
  	@posts = Post.all
		render json: @posts, status: 200
		

		# PostIndex.new.call

		# response = RestClient.get "http://localhost:3000/v1/posts"
		# res = RestClient::Request.execute(method: :get, url: 'http://localhost:3000/v1/posts', timeout: 10)
		# posts = JSON.parse(respose)

  end

  def show_posts
  	url = "http://localhost:3000/v1/posts"
  	response = RestClient.get(url)
  end

  def create
		@post = Post.new(post_params)
		if @post.save!
			render :create, status: 201
		else
			head(:unprocessable_entity)
		end
  end

  def show
  	@post = Post.find(params[:id])
  	render :show, status: 200
  end

  def destroy
  	@post.destroy
  	render json: :Post_deleted, status: 200
  end

  def update
  	if @post.update(post_params)
  		render json: :Post_updated, status: 200
  	else
  		render json: {error: "unprocessible_Entity"}, status: :unauthorized
  	end
  end

  private
  def post_params
    params.require(:post).permit(:id, :title, :description, :file)
  end

  def set_id
  	@post = Post.find(params[:id])
  end

end
