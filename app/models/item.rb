class Item < ApplicationRecord
  has_and_belongs_to_many :menus, optional: true
  
  # Validations
  validates :title, :quantity, presence: true
end
