class Revenue < ApplicationRecord
  validates :amount, presence: true
  validates :head_count, presence: true
end
