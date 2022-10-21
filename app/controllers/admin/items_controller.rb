class Admin::ItemsController < ApplicationController
  def index
    @items=Item.all 
  end
  
  def new
    @item=Item.new
  end  
  
  def show
    @item=Item.find(params[:id])
  end
  
  def create
    item=Item.new
    item.save
    redirect_to admin_item_path
  end
end