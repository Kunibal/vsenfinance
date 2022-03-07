class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  validates :quantity, presence: true

  # 小計の計算
  def subtotal
    (self.quantity * self.item.price * 1.10).round
  end
end
