class PostsController < ApplicationController
  def index
  end

  def show
  end

  def create
    
    # @post = Post.new(post_params)
    # @post.user = current_user # Assuming you have a method to get the current logged-in user

    # if @post.save
    #   render json: @post, status: :created
    # else
    #   render json: @post.errors, status: :unprocessable_entity
    # end
  end

  def update
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :image_url)
  end
end
