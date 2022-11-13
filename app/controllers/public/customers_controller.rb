class Public::CustomersController < ApplicationController
  def show
    @customer=current_customer
  end

  def edit
    @public_customer=current_customer
  end

  def update
    @public = current_customer
    @public.update(customer_params)
    redirect_to customers_path
  end

  def unsubscibe
  end

  def withdraw
    @public_customer=current_customer
    @public_customer.update(is_deleted: true)
    sign_out_and_redirect(current_customer)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana, :postal_code, :address, :telephone_number,:email)
  end

end
