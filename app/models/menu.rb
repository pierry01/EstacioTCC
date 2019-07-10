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
  has_many :items, dependent: :delete_all
  
  # Nested Attributes
  accepts_nested_attributes_for :items
end
