class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  validates :order_price, presence: true
  validates :customer_name, presence: true
  validates :customer_address, presence: true
end
