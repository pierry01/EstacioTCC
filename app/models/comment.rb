class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :menu, optional: true
  belongs_to :event, optional: true
  
  # Validations
  validates :body, length: { minimum: 2 }
end
