class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  validates :order_price, presence: true
  validates :customer_name, presence: true
  validates :customer_address, presence: true

  # グラフのための情報収集
  # 期間を決めるため
  scope :for_date_range, -> (start_date, end_date) do
    where(created_at: start_date.beginning_of_day..end_date.end_of_day)
	end
end
