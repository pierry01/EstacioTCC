class Menu < ApplicationRecord
  # Kaminari
  paginates_per 6
  
  # Validations
  validates :title, :description, :price, presence: true
  
  has_one_attached :image
  has_many :comments, dependent: :delete_all
end
