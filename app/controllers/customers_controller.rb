class CustomersController < ApplicationController
  before_action :authenticate_admin!, only: [:index]
  before_action :ensure_correct_user, only: [:show, :edit]
  before_action :set_customer, only: [:show, :edit, :update]

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @orders = @customer.orders.order(created_at: :desc).page params[:page]
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :last_name_kana, :first_name, :first_name_kana,
                                      :postal_code, :prefecture_code, :city, :block, :building_name)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
