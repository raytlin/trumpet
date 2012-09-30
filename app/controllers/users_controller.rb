class UsersController < ApplicationController
  
  layout "admin"
  
  before_filter :confirm_logged_in
  
  def index
    list 
    render("list")
  end

  def list 
    @users = User.find(:all)
  end 
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "new user created"
      redirect_to(:action => "list")
    else 
      flash[:notice] = "something went wrong. nothing created"
      render("new")
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "update was successful"
      redirect_to(:action => "list")
    else 
      flash[:notice] = "update was not successful"
      render("edit")
    end
  end

  def delete
    @user = User.find(params[:id])
  end
  
  def destroy
    user = User.find(params[:id]).username
    User.find(params[:id]).destroy
    
    flash[:notice] = "user #{user} was deleted"
    
    redirect_to(:action => 'list')
  end
end
