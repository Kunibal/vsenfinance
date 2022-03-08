class HomesController < ApplicationController
  def homepage
  end

  def top
    @items = Item.order(created_at: :desc).limit(3)
    @posts = Post.order(created_at: :desc).limit(6)
  end

  def about
  end

  def contact
  end
end
