class Api::PostsController < ApplicationController

  def index
    @posts = Post.all
    respond_with @posts
  end
  
  def show
    @post = Post.find_by_id(params[:id])
    respond_with @post
  end
  
end
