class AdminUsersController < ApplicationController
  
  layout "admin"
  
  before_filter :confirm_logged_in
  
  def index
    list
    render('list')
  end

  def new
    @adminuser = AdminUser.new
  end

  def create 
    @adminuser = AdminUser.new(params[:adminuser])
    if @adminuser.save 
      flash[:notice] = "admin user saved. good job."
      redirect_to(:action => 'list')
    else 
      flash[:notice] = "admin user didnt save. bad job."
      render("new")
    end
  end 
  
  def list 
    @adminusers = AdminUser.all
  end
  
  def edit
    @admin = AdminUser.find(params[:id])
  end

  def update 
    if AdminUser.find(params[:id]).update_attributes(params[:admin])
      flash[:notice] = "admin updated"
      redirect_to(:action => "list")
    else 
      flash[:notice] = "update failed"
      render("edit")
    end
    
  end
  
  def delete
    @admin = AdminUser.find(params[:id])
  end
  
  def destroy
    name = AdminUser.find(params[:id]).username
    AdminUser.find(params[:id]).destroy
    flash[:notice] = "admin user #{name} deleted"
    redirect_to(:action => "list")
  end
end
