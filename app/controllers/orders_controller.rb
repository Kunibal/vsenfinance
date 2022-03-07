class OrdersController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :create, :confirm]
  before_action :authenticate_admin!, only: [:index]
  before_action :ensure_correct_user, only: [:show]

  def index
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    # カートにある商品を全て選択
    @current_cart.order_items.each do |item|
      # orderに入れてからカートIDをnilにする
      @order.order_items << item
      item.cart_id = nil
    end
    @order.save
    # 保存後カートを空にする
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    # 確認画面へ
    redirect_to confirm_order_path
  end

  def confirm_order
  end

  def complete_order
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :customer_name, :customer_address, :order_price)
  end
end
