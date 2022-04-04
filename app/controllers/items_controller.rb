class ItemsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :edit]
  before_action :ensure_correct_user, only: [:show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc).page params[:page]
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    tags = Vision.get_image_data(item.image)
    tags.each do |tag|
      item.tags.create(name: tag)
    end
    redirect_to item_path(item.id)
  end

  def show
    @tags = Tag.all
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :tag, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
