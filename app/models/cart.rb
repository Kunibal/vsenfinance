class Cart < ApplicationRecord
  has_many :order_items, dependent: :destroy
  # カートに商品を入れるために、中間テーブルを使用
  has_many :items, through: :order_items

  # 合計の計算
  def total_price
    sum = 0
    self.order_items.each do |order_item|
      sum += order_item.subtotal
    end
    return sum
  end
end
