class Admin::OrdersDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order=@order_detail.order
    @order_detail.update(making_status: params[:order_detail][:making_status])
    if params[:order_detail][:making_status]=="under_manufacture"
      @order.update(status: "under_manufacture")
    end

    @order_details=@order.order_details
    if @order_details.count==@order_details.where(making_status: "manufacturing_completed").count
      @order.update(status: "preparing_to_ship")
    end
    redirect_to admin_order_path(@order_detail.order.id)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
