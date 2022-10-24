class Public::CustomersController < ApplicationController
  def show
    @customer=Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def unsubscibe
  end

  def destroy
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana, :postal_code, :address, :telephone_number,:email)
  end

end
