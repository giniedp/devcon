class RolesController < ApplicationController
  # GET /roles
  # GET /roles.xml
  def index
    
    fancygrid_for :roles do |grid|
      
      grid.hidden :id
      grid.attributes :name
      grid.rendered :actions
      grid.url = roles_path
      grid.find
      
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @roles }
    end
  end

  # GET /roles/new
  # GET /roles/new.xml
  def new
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @role }
    end
  end

  # GET /roles/1/edit
  def edit
    @role = Role.find(params[:id])
  end

  # POST /roles
  # POST /roles.xml
  def create
    @role = Role.new(params[:role])
    
    @role.save
    respond_with @role
  end

  # PUT /roles/1
  # PUT /roles/1.xml
  def update
    @role = Role.find(params[:id])

    @role.update_attributes(params[:role])
    respond_with @role
  end

  # DELETE /roles/1
  # DELETE /roles/1.xml
  def destroy
    @role = Role.find(params[:id])
    
    @role.destroy
    respond_with @role
  end
end
