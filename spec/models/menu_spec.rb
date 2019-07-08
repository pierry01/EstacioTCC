require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'Tests' do
    let(:menu) { FactoryBot.create :menu }
    
    it { expect(menu).to be_valid }
    it { expect(Menu.create).to be_invalid }
  end
  
  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should have_many(:comments) }
  end
end
