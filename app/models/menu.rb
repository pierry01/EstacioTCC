class Menu < ApplicationRecord
  # Kaminari
  paginates_per 5
  
  has_one_attached :image
  has_many :comments, dependent: :delete_all
end
