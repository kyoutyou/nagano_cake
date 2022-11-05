class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=current_customer
  end

  def confirm
    @cart_items=current_customer.cart_items
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    if params[:select_address]==0
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.first_name + current_customer.last_name
    elsif params[:select_address]==1
      @address = Address.find(params[:order][:address_id])
      @order.shipping_postal_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.shipping_name = @address.name
    end
    @order.save
  end

  def complete
  end

  def create
    @order=Order.new(order_params)
    @order.save
    redirect_to orders_complete_path
  end

  def index
    @orders=current_customer.orders
  end

  def show
    @orders=current_customer.orders
    @order.shipping_cost = 800
    @cart_items=current_customer.cart_items
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :total_payment, :status, :shipping_cost,:payment_method, :shipping_postal_code, :shipping_address, :shipping_name)
  end
end
