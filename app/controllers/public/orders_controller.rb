class Public::OrdersController < ApplicationController
  before_action :cart_empty, only:[:new]
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
    @cart_items=current_customer.cart_items.all
    @cart_items.each do |cart_item|
    @order_detail=OrderDetail.new
    @order_detail.item_id=cart_item.item_id
    @order_detail.order_id=@order.id
    @order_detail.price=cart_item.item.price
    @order_detail.amount=cart_item.amount
    @order_detail.making_status=0
    @order_detail.save
    end
    redirect_to orders_complete_path
  end

  def index
    @orders=current_customer.orders
  end

  def show
    @order=Order.find(params[:id])
    @order_details=@order.order_details
  end

  def cart_empty
    @cart_items=current_customer.cart_items
    unless @cart_items.exists?
      redirect_to cart_items_path
    end
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :total_payment, :status, :shipping_cost,:payment_method, :shipping_postal_code, :shipping_address, :shipping_name)
  end
end
