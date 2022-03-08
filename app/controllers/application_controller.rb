class ApplicationController < ActionController::Base
  # どこでも使えるようにApplicationControllerに記述
  before_action :current_cart

  private

  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(:id => session[:cart_id])
      # カートが存在していれば@current_cart変数に
      if cart.present?
        @current_cart = cart
      else
        # なければ、nilにする
        session[:cart_id] = nil
      end
    end

    # nilなら新しいカートを作成
    if session[:cart_id] == nil
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  end

  # current customerとadminに許可与える
  def ensure_correct_user
    @customer = current_customer
    # 管理者は常に一人
    @admin = current_admin
    if @customer || @admin
    else
      redirect_to root_path
    end
  end
end
