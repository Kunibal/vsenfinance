class CartsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart

  def show
  end

  # カートを空にする
  def destroy
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  private

  def set_cart
    @cart = @current_cart
  end
end
