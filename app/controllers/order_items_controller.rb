class OrderItemsController < ApplicationController
  before_action :authenticate_customer!

  def create
    # 商品とカートを定義
    chosen_item = Item.find(params[:item_id])
    current_cart = @current_cart

    # 商品をカートに入れる
    if current_cart.items.include?(chosen_item)
      # 商品があるかを確認
      @order_item = current_cart.order_items.find_by(:item_id => chosen_item)
      # あれば個数を一個で増やす
      @order_item.quantity += 1
    else
      # カートに何も入っていなければカートに商品を追加
      @order_item = OrderItem.new
      @order_item.cart = current_cart
      @order_item.item = chosen_item
    end

    # 保存して、カートページへ
    @order_item.save
    redirect_to cart_path(current_cart)
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    @order_item = OrderItem.find(params[:id])
    @order_item.quantity += 1
    @order_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @order_item = OrderItem.find(params[:id])
    # ０でないことを確認
    if @order_item.quantity > 1
      @order_item.quantity -= 1
    end
    @order_item.save
    redirect_to cart_path(@current_cart)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :item_id, :cart_id)
  end
end
