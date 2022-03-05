class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  def add_tax
    (self.price * 1.10).round
  end
end
