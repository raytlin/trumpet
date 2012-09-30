class PostsController < ApplicationController
  
  layout "admin"
  
  before_filter :confirm_logged_in
  
  def index
    list
    render("list")
  end

  def list
    @posts = Post.find(:all)
  end
  
  def new
    @post = Post.new
    @all_user_ids = User.all.collect {|x| [x.username, x.id] }
  end

  def create 
    @post = Post.new(params[:post])
    
    if @post.save 
      flash[:notice] = "new post saved"
      redirect_to(:action => "list")
    else 
      flash[:notice] = "post did not save for some reason. Oh well."
      render("new")
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update 
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "post updated successfully"
      redirect_to(:action => "list")
    else  
      flash[:notice] = "post update did not work for whatever reason"
      render("edit")
    end
  end 
  
  def delete
    
    @post = Post.find(params[:id])
  end
  
  def destroy
    Post.find(params[:id]).destroy
    flash[:notice] = "post deleted"
    redirect_to(:action => 'list')
  end
end
