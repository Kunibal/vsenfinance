class RevenuesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @revenues = Revenue.all
    @revenue = Revenue.new
  end

  def ec_info
  end

  def filter
    # グラフをボタンで変えるように
    if params[:commit] == "Count"
      @chartdata = Order.group_by_day(:created_at).count
    else
      @chartdata = Order.group_by_day(:created_at).sum(:order_price)
    end
  end

  def create
    @revenue = Revenue.new(revenue_params)
    if @revenue.save
      redirect_to revenues_path
    else
      redirect_to dashboard_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def revenue_params
    params.require(:revenue).permit(:amount, :head_count, :memo)
  end
end
