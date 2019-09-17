class Item < ApplicationRecord
  # Kaminari
  paginates_per 6
  
  # Validations
  validates :title, :quantity, presence: true
end
