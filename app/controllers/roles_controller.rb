class RolesController < ApplicationController
before_filter :accessible_permissions, :only => [:new, :edit, :show, :update, :create]
load_and_authorize_resource
  # GET /roles
  # GET /roles.xml
  def index
    @roles = Role.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @roles }
    end
  end

  # GET /roles/1
  # GET /roles/1.xml
  def show
    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @role }
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

    respond_to do |format|
      if @role.save
@role.save_permissions(params[:role_ids]) 
        format.html { redirect_to(@role, :notice => 'Role was successfully created.') }
        format.xml  { render :xml => @role, :status => :created, :location => @role }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /roles/1
  # PUT /roles/1.xml
  def update
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
@role.save_permissions(params[:role_ids])
        format.html { redirect_to(@role, :notice => 'Role was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.xml
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to(roles_url, :notice => 'Role was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
  # Get roles accessible by the current user #----------------------------------------------------
  # Role.reflect_on_all_associations(:has_and_belongs_to_many).first.class_name
  # => "User" 
  #ruby-1.8.7-p302 > Role.reflect_on_all_associations(:has_many).first.class_name
  def accessible_permissions
    @accessible_permissions = Role.accessible_permissions
  end
  # Get roles accessible by the current user #----------------------------------------------------
  # Role.reflect_on_all_associations(:has_and_belongs_to_many).first.class_name
  # => "User" 
  #ruby-1.8.7-p302 > Role.reflect_on_all_associations(:has_many).first.class_name
  def accessible_permissions
    @accessible_permissions = Role.accessible_permissions
  end
end
