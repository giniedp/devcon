class BlogsController < ApplicationController
  
  before_filter do
    scoped_user(:user_id)
  end
  
  # GET /blogs
  # GET /blogs.xml
  def index
    
    fancygrid_for :blogs do |grid|
      grid.hidden :id, :user_id
      grid.attributes :title, :description
      grid.rendered :actions
      grid.url = user_blogs_path(scoped_user)
      grid.find do |query|
        query.conditions ["blogs.user_id = ?", scoped_user]
        query.select "*"
      end
    end
    
  end

  # GET /blogs/1
  # GET /blogs/1.xml
  def show
    @blog = Blog.find(params[:id])
    
    fancygrid_for :posts do |grid|
      grid.columns_for :blog do |blog|
        blog.hidden :id, :user_id
        blog.attributes :title
      end
      
      grid.attributes :id, :blog_id, :title, :description, :body
      grid.rendered :actions
      grid.url = user_blog_posts_path(scoped_user, @blog)
      grid.find do |query|
        query.conditions ["blogs.user_id = ?", scoped_user]
        query.conditions ["posts.blog_id = ?", @blog]
      end
    end
    
    respond_with @blog
  end

  # GET /blogs/new
  # GET /blogs/new.xml
  def new
    @blog = Blog.new
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
    respond_with scoped_user, @blog
  end

  # PUT /blogs/1
  # PUT /blogs/1.xml
  def update
    @blog = Blog.find(params[:id])
    @blog.update_attributes(params[:blog])
    respond_with scoped_user, @blog
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.xml
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    respond_with scoped_user, @blog
  end
end
