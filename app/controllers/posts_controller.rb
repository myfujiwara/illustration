class PostsController < ApplicationController
  def top
    @posts = @posts.order("id desc")
    @user = User.find(current_user.id)
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