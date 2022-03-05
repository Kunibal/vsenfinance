class ApplicationController < ActionController::Base
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
