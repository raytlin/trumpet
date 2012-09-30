class PublicController < ApplicationController
  
  layout 'public'
  
  before_filter :confirm_logged_in_public, :except => [:login, :attempt_login, :logout, :signup, :create]
  
  def user
    @users = User.find(:all, :order => 'username ASC')
  end

  def profile
    @user = User.find(params[:id])
    @post = Post.new
    @posts = Post.where(:user_id => params[:id]).order("created_at DESC")
  end
  
  def create_post
    @post = Post.new
    x = params[:post]
    @post.content = x[:content]
    @post.user_id = params[:id]
    @post.poster_name = session[:name]
    @post.poster_pic = User.find(session[:user_id]).picture
    
    if @post.save
      flash[:notice] = 'post was saved OK!'
      redirect_to(:action => 'profile', :id => params[:id])
    else 
      flash[:notice] = 'post did not go so well. did not save. dunno why'
      render('profile')
    end
  end

  def login
    # done
  end

  def attempt_login
    authorized_user = User.authenticate(params[:username], params[:password])
    
    if authorized_user 
      session[:user_id] = authorized_user.id 
      session[:name] = authorized_user.username
      flash[:notice] = 'log in successful'
      redirect_to(:action => 'profile', :id => session[:user_id])
    else
      flash[:notice] = 'log in NOT successful'
      redirect_to(:action => 'login')
    end
  end

  def signup
    
  end
  
  def create
    @user = User.new(params[:user])
    @user.picture = params[:picture]
    if @user.save 
      flash[:notice] = 'congratulations. you are the newest member of this community'
      session[:user_id] = @user.id
      session[:name] = @user.username
      # redirect_to(:action => 'profile')
      redirect_to(:action => "profile", :id => session[:user_id])
    else
      flash[:notice] = 'sign up didnt work. you should try again and again and again or you will regret it!'
      render('signup')
    end
  end
  
  def logout
    session[:user_id] = nil
    session[:name] = nil
    flash[:notice] = 'you have been logged out'
    redirect_to(:action => 'login')
  end
  
  def pickup
    
  end
  
  def create_pickup_order
    order_hash = params[:free_shipping_order]
    order_hash[:user_id] = params[:id]
    
    
    @free_shipping_order = FreeShippingOrder.new(order_hash)
    
    
    if @free_shipping_order.save
      flash[:notice] = "order submitted successfully. You may recieve an email confirmation someday."
      redirect_to(:action => 'profile', :id => params[:id])
    else
      flash[:notice] = 'order submit failed'
      render('pickup')
    end
    
  end
end
