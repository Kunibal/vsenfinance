module ApplicationHelper

  # current_cartを定義
  # def current_cart
  #   # カートが存在していなければ、新しいカートsessionを作成
  #   if session[:cart_id] == nil
  #     @current_cart = Cart.new
  #     session[:cart_id] = current_cart.id
  #   else
  #     Cart.find_by_id(session[:cart_id])
  #   end
  # end
end
