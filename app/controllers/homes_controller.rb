class HomesController < ApplicationController
  def homepage
  end

  def top
    @items = Item.order(created_at: :desc).limit(4)
  end

  def about
  end

  def contact
  end
end
