class PostsController < ApplicationController
  def top
    @posts = Post.all
    @posts = @posts.order("id desc")
    # @user = User.where(params[:id])
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
    params.require(:post).permit(:title, :comment, images: [])
  end
end