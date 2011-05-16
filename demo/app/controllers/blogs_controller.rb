class BlogsController < ApplicationController
  # GET /blogs
  # GET /blogs.xml
  def index
    
    fancygrid_for :blogs do |grid|
      grid.hidden :id, :user_id
      grid.attributes :title, :description
      grid.rendered :actions
      grid.url = blogs_path
      grid.find
    end
    
  end

  # GET /blogs/1
  # GET /blogs/1.xml
  def show
    @blog = Blog.find(params[:id])
    
    fancygrid_for :posts do |grid|
      grid.hidden :id, :blog_id
      grid.attributes :topic, :description, :body
      grid.rendered :actions
      grid.url = blog_posts_path(@blog)
      grid.find do |query|
        query.conditions ["post.blog_id = ?", @blog]
      end
    end
    
    respond_with @blog
  end

  # GET /blogs/new
  # GET /blogs/new.xml
  def new
    @blog = Blog.new
    respond_with @blog
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

  # POST /blogs
  # POST /blogs.xml
  def create
    @blog = Blog.new(params[:blog])
    @blog.save
    respond_with @blog
  end

  # PUT /blogs/1
  # PUT /blogs/1.xml
  def update
    @blog = Blog.find(params[:id])
    @blog.update_attributes(params[:blog])
    respond_with @blog
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.xml
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    respond_with @blog
  end
end
