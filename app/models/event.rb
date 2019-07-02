class Event < ApplicationRecord
  # Kaminari
  paginates_per 5
  
  # Associations
  has_one_attached :image
  has_and_belongs_to_many :users
  has_many :comments, dependent: :delete_all
  
  # Validations
  validate :start_is_before_finish
  validates :title, :description, :start, :finish, presence: true
  
  # Scopes
  scope :random, ->(quantity) { limit(quantity).order("RANDOM()") }
  
  private
  
  def start_is_before_finish
    return if start.blank? || finish.blank?
    errors.add(:finish, 'deve ser após o início da palestra') if finish <= start
  end
end
