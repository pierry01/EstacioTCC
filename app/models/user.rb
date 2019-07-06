class User < ApplicationRecord
  # Ratyrate
  ratyrate_rater
  
  # Kaminari
  paginates_per 6

  has_and_belongs_to_many :events
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
