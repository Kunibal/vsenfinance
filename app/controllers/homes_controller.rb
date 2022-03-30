class HomesController < ApplicationController
  before_action :authenticate_admin!, only: [:dashboard]

  def homepage
  end

  def top
    @items = Item.order(created_at: :desc).limit(3)
    @posts = Post.order(created_at: :desc).limit(6)
  end

  def dashboard
    # お知らせ用
    @posts = Post.order(created_at: :desc).limit(4)
    @post = Post.new

    # ECサイトの情報をグラフ化（今週分）
    end_date = Date.today.end_of_week(start_day = :saturday)
    start_date = Date.today.beginning_of_week(start_day = :sunday)
    zero_filled_date_range = (start_date.to_date..end_date.to_date).map{ |date| [date, 0] }.to_h
    @ec_chart = zero_filled_date_range.merge(Order.where(created_at: start_date..end_date).group_by_day(:created_at).sum(:order_price))

    # 店内の情報をグラフ化（今週分）
    end_date = Date.today.end_of_week(start_day = :saturday)
    start_date = Date.today.beginning_of_week(start_day = :sunday)
    zero_filled_date_range = (start_date.to_date..end_date.to_date).map{ |date| [date, 0] }.to_h
    @store_chart = zero_filled_date_range.merge(Revenue.where(created_at: start_date..end_date).group_by_day(:created_at).sum(:amount))

    @weekly_revenue = Revenue.where(created_at: start_date..end_date).group_by_week(:created_at).sum(:amount).values
  end
end