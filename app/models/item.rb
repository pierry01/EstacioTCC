class Item < ApplicationRecord
  belongs_to :menu, optional: true
  
  # Validations
  validates :title, :quantity, presence: true
end
