class HomesController < ApplicationController
  before_action :authenticate_admin!, only: [:dashboard]

  def homepage
  end

  def top
    @items = Item.order(created_at: :desc).limit(3)
    @posts = Post.order(created_at: :desc).limit(6)
  end

  def about
  end

  def contact
  end

  def dashboard
    # ECサイトの情報をグラフ化
    # @sales = Order.count_by_date(Date.today.beginning_of_week, Date.today.beginning_of_week + 6.days, :order_price)

    # お知らせ用
    @posts = Post.order(created_at: :desc).limit(4)
    @post = Post.new

    end_date = Time.current
    start_date = 7.days.ago.beginning_of_day
    zero_filled_date_range = (start_date.to_date..end_date.to_date).map{ |date| [date, 0] }.to_h
    @chart_data = zero_filled_date_range.merge(Order.where(created_at: start_date..end_date).group_by_day(:created_at).sum(:order_price))
  end
end
