class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
    
    fancygrid_for :posts do |grid|
      grid.attributes :id, :blog_id, :title, :description, :body
      grid.rendered :actions
      grid.url = blog_posts_path(current_blog)
      grid.find do |query|
        query.conditions ["posts.blog_id = ?", current_blog]
      end
    end

  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_with @post.blog, @post
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new(:blog => current_blog)

    respond_with @post
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])
    @post.save
    respond_with @post.blog, @post
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    respond_with @post.blog, @post
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_with @post.blog, @post
  end
end
