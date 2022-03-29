class OrdersController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :create, :confirm_order, :complete_order]
  before_action :authenticate_admin!, only: [:index]
  before_action :ensure_correct_user, only: [:show]

  def index
    @orders = Order.order(created_at: :desc).page params[:page]
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_customer.orders.new(order_params)
    # カートにある商品を全て選択
    @current_cart.order_items.each do |item|
      # orderに入れてからカートIDをnilにする
      @order.order_items << item
      item.cart_id = nil
    end

    if @order.save
      # 保存後カートを空にする
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
    end
    # 確認画面へ
    redirect_to complete_order_path
  end

  def confirm_order
    @order = Order.new(order_params)

    if params[:order]
      # 会員の情報をまとめて、orderの変数に渡す
      @order.customer_name = current_customer.last_name + current_customer.first_name
      @order.customer_address = current_customer.postal_code.to_s + current_customer.prefecture_name + current_customer.city + current_customer.block
      @order.order_price = @current_cart.total_price
    end
  end

  def complete_order
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :customer_name, :customer_address, :order_price, :payment_method)
  end
end
