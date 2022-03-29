class Item < ApplicationRecord
  has_many :order_items, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  has_one_attached :image

  paginates_per 8

  def item_image
    image.attached? ? image : 'no_image.jpg'
  end

  def add_tax
    (self.price * 1.10).round.to_s(:delimited)
  end
end
