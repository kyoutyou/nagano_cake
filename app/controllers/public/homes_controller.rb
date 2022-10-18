class Public::HomesController < ApplicationController
  def top
    @items=Item.new
  end
  
  def about
  end
end
