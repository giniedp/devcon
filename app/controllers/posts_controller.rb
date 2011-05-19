class PostsController < ApplicationController
  
  before_filter do
    scoped_user(:user_id)
    scoped_blog(:blog_id)
  end
  
  # GET /posts
  # GET /posts.xml
  def index
    
    fancygrid_for :posts do |grid|
      grid.columns_for :blog do |blog|
        blog.hidden :id, :user_id
        blog.attributes :title
      end
      
      grid.hidden :body
      grid.attributes :id, :blog_id, :title, :description
      grid.rendered :actions
      grid.url = user_blog_posts_path(scoped_user, scoped_blog)
      grid.find do |query|
        query.conditions ["blogs.user_id = ?", scoped_user]
        query.conditions ["posts.blog_id = ?", scoped_blog]
        query.include :blog => { :user => {} }
      end
    end

    #respond_with(@fancygrid[:posts].dataset, :grid => @fancygrid[:posts], :responder => Responder::FancygridResponder)
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    #respond_to do |format|
    #  format.html
    #  format.pdf do
    #    Tools::Fop.render_pdf({
    #      :xml => @post.to_pdf,
    #      :xsl => Rails.root.join("app", "views", "xsl", "post.xsl")
    #    }) do |pdf, success, error|
    #      if success
    #        send_file(pdf, :filename => "output.pdf", :content_type => "application/pdf")
    #      else 
    #        # TODO: raise or log error
    #      end
    #    end   
    #  end
    #end

    respond_with scoped_user, @post.blog, @post, :use_prawn => true
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new(:blog => scoped_blog)
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
    respond_with scoped_user, @post.blog, @post
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    respond_with scoped_user, @post.blog, @post
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_with scoped_user, @post.blog, @post
  end
end
