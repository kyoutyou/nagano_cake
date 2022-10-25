class Public::AddressesController < ApplicationController
  def index
    @address=Address.new
    @address=current_customer.addresses
  end
  
  def edit
    @address=Address.find(params[:id])
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
    @address=Address.find(params[:id])
    @address.destroy
    redirect_to  addresses_path
  end 
  
  
end
