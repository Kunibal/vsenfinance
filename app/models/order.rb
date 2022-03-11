class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  validates :order_price, presence: true
  validates :customer_name, presence: true
  validates :customer_address, presence: true

  # グラフのための情報収集
  # 期間を決めるため
#   scope :for_date_range, -> (start_date, end_date) do
#     where(created_at: start_date.beginning_of_day..end_date.end_of_day)
# 	end

  # rails cで試したこと：Order.group('date(created_at)').sum(:order_price)
  # その結果：{"2022-03-09"=>47520}
  # １日の売り上げを決めるため
  # def self.count_by_date(start_date, end_date, sales)
	 # results = for_date_range(start_date, end_date).group('date(created_at)').sum(sales)

  #   show_all_days(start_date, end_date, results)
  # end

  # def self.show_all_days(start_date, end_date, results_hash)
  #   date_range = (start_date.to_date..end_date.to_date).map do |date|
  #     date.strftime('%Y/%m/%d')
  #   end
  #   hash_show_all_days = {}
  #   date_range.each do |date|
  #     hash_show_all_days[date] = results_hash[date] || 0
  #   end
  #   hash_show_all_days
  # end
end
