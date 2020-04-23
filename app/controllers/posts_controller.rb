class PostsController < ApplicationController
  
  # before_action :authorize
  
  def top
    @posts = Post.all
    @posts = @posts.order("id desc")
    # @user = User.find(params[:id])
    @user = User.find(current_user.id)
    @reccomends = Post.where.not(id: current_user.id).limit(5)
  end
  
  def upload
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
  end
  
  def artworks
    @post =Post.find(params[:id])
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :comment, images: []).merge(user_id: current_user.id)
  end
end