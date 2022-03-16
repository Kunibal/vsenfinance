class Revenue < ApplicationRecord
  validates :amount, presence: true
  validates :head_count, presence: true

  paginates_per 10
end
