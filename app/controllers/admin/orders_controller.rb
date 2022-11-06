class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @orders=current_customer.cart_items.all
  end 
  
  def update
  end
end
