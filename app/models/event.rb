class Event < ApplicationRecord
  has_one_attached :image
  has_and_belongs_to_many :users
  has_many :comments, 
  dependent: :delete_all
end
