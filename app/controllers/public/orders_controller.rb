class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=current_customer
  end

  def confirm
    @order = Order.new(order_params)
    if
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.first_name + current_customer.last_name
    elsif
      
    else
      
    end
  end

  def complete
  end

  def create
  end

  def index
    @orders=current_customer.orders
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :shipping_postal_code, :shipping_address, :shipping_name)
  end
end
