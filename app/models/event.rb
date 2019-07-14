class Event < ApplicationRecord
  # Ratyrate
  ratyrate_rateable 'quality'
  
  # Kaminari
  paginates_per 6
  
  # Associations
  has_one_attached :image
  has_and_belongs_to_many :users
  has_many :comments, dependent: :delete_all

  # Validations
  validate :start_is_before_finish
  validates :title, :description, :start, :finish, presence: true
  
  # Scopes
  scope :random, ->(quantity) { limit(quantity).order(Arel.sql("RANDOM()")) }
  scope :with_preloaded_image, -> { preload(image_attachment: :blob) }

  private

  def start_is_before_finish
    return if start.blank? || finish.blank?
    errors.add(:finish, 'deve ser após o início da palestra') if finish <= start
  end
end
