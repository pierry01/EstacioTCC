class Menu < ApplicationRecord
  # Ratyrate
  ratyrate_rateable 'quality'
  
  # Kaminari
  paginates_per 6
  
  # Validations
  validates :title, :description, :price, presence: true
  
  # Active Storage
  has_one_attached :image
  
  # Associations
  has_many :comments, dependent: :delete_all
end
