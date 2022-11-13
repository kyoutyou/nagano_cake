class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @order_details=@order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details=@order.order_details
    if params[:order][:status]=="payment_confirmation"
      @order_details.update_all(making_status: "awaiting_production")
    end
    @order.update(status: params[:order][:status])
    redirect_to admin_order_path(@order.id)
  end

  private
  def order_params
        params.require(:order).permit(:status)

  end
end
