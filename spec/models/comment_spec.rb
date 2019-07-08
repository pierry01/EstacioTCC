require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Tests' do
    let(:comment) { FactoryBot.create :comment }
    
    it { expect(comment).to be_valid }
    it { expect(Comment.create).to be_invalid }
  end
  
  describe 'Validations' do
    it { should belong_to(:user) }
    it { should belong_to(:menu).optional }
    it { should belong_to(:event).optional }
    it { should validate_length_of(:body).is_at_least(2) }
  end
end
