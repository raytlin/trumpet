class FreeShippingOrdersController < ApplicationController
  layout "admin"
  
  before_filter :confirm_logged_in
  
  def index
    list
    render("list")
  end
  
  def list
    @orders = FreeShippingOrder.all 
  end
  
  def processed 
    @order = FreeShippingOrder.find(params[:id])
    if @order.processed == false 
      @order.processed = true 
    else 
      @order.processed = false
    end
    @order.save
    redirect_to(:action => 'list')
  end
end
