class RevenuesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @revenues = Revenue.all
    @revenue = Revenue.new
  end

  def ec_info
  end

  def filter
    # 月間売上
    end_date_m = Date.today.beginning_of_month.next_month
    start_date_m = Date.today.beginning_of_month
    zero_filled_m_date_range = (start_date_m.to_date..end_date_m.to_date).map{ |date| [date, 0] }.to_h

    # グラフをボタンで変えるように
    if params[:commit] == "月間売上"
      @chartdata = zero_filled_m_date_range.merge(Order.where(created_at: start_date_m..end_date_m).group_by_day(:created_at).sum(:order_price))
    else
      # 年間売上
      @chartdata = Order.where(created_at: Date.today.beginning_of_year..Date.today.next_year).group_by_month(:created_at).sum(:order_price)
    end
  end

  def create
    @revenue = Revenue.new(revenue_params)
    @revenue.save
  end

  def destroy
    @revenue = Revenue.find(params[:id])
    @revenue.destroy
  end

  private

  def revenue_params
    params.require(:revenue).permit(:amount, :head_count, :memo)
  end
end
