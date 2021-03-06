class RevenuesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @revenues = Revenue.order(created_at: :desc).page params[:page]
    @revenue = Revenue.new

    end_date_m = Date.today.end_of_month
    start_date_m = Date.today.beginning_of_month
    zero_filled_m_date_range = (start_date_m.to_date..end_date_m.to_date).map{ |date| [date, 0] }.to_h
    @chartdata = zero_filled_m_date_range.merge(Revenue.where(created_at: start_date_m..end_date_m).group_by_day(:created_at).sum(:amount))

    @monthly_revenue = Revenue.where(created_at: start_date_m..end_date_m).group_by_month(:created_at).sum(:amount).values
    @monthly_head_count = Revenue.where(created_at: start_date_m..end_date_m).group_by_month(:created_at).sum(:head_count).values
  end

  # PDF化してダウンロード
  def download
    html = render_to_string({
        layout: 'pdf',
        template: 'revenues/download.html.erb',
        locals: { :@revenues => Revenue.order(created_at: :desc).limit(31) }
      })

    pdf = Grover.new(html).to_pdf

    send_data(pdf,  filename: "#{Date.today}_売上.pdf",
                    type: 'application/pdf',
                    disposition: 'attachment')
  end

  def store_filter
    # 月間売上
    end_date_m = Date.today.end_of_month
    start_date_m = Date.today.beginning_of_month
    zero_filled_m_date_range = (start_date_m.to_date..end_date_m.to_date).map{ |date| [date, 0] }.to_h

    # グラフをボタンで変えるように
    if params[:commit] == "月間売上"
      @chartdata = zero_filled_m_date_range.merge(Revenue.where(created_at: start_date_m..end_date_m).group_by_day(:created_at).sum(:amount))
    else
      # 年間売上
      @chartdata = Revenue.where(created_at: Date.today.beginning_of_year..Date.today.end_of_year).group_by_month(:created_at).sum(:amount)
    end
  end

  def ec_info
    end_date_m = Date.today.end_of_month
    start_date_m = Date.today.beginning_of_month
    zero_filled_m_date_range = (start_date_m.to_date..end_date_m.to_date).map{ |date| [date, 0] }.to_h
    @chartdata = zero_filled_m_date_range.merge(Order.where(created_at: start_date_m..end_date_m).group_by_day(:created_at).sum(:order_price))

    @monthly_order_revenue = Order.where(created_at: start_date_m..end_date_m).group_by_month(:created_at).sum(:order_price).values
    @monthly_order_count = Order.where(created_at: start_date_m..end_date_m).group_by_month(:created_at).count.values
  end

  def ec_filter
    # 月間売上
    end_date_m = Date.today.end_of_month
    start_date_m = Date.today.beginning_of_month
    zero_filled_m_date_range = (start_date_m.to_date..end_date_m.to_date).map{ |date| [date, 0] }.to_h

    # グラフをボタンで変えるように
    if params[:commit] == "月間売上"
      @chartdata = zero_filled_m_date_range.merge(Order.where(created_at: start_date_m..end_date_m).group_by_day(:created_at).sum(:order_price))
    else
      # 年間売上
      @chartdata = Order.where(created_at: Date.today.beginning_of_year..Date.today.end_of_year).group_by_month(:created_at).sum(:order_price)
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
