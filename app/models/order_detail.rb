class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { can_not_start:0,awaiting_production:1,under_manufacture:2,manufacturing_completed:3}
  def subtotal
    (price*1.1).floor * amount
  end
end
