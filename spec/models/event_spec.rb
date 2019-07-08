require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Tests' do
    let(:event) { FactoryBot.create :event }
    
    it { expect(event).to be_valid }
    it { expect(Event.create).to be_invalid }
  end
  
  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:start) }
    it { should validate_presence_of(:finish) }
    it { should have_many(:comments) } 
    it { should have_and_belong_to_many(:users) }
    
    it '#start_is_before_finish' do
      event = Event.create!(
        title: 'Título da Palestra', 
        description: 'Descrição da Palestra', 
        start: '10:00:00', 
        finish: '11:00:00'
      )
      
      expect(event).to be_valid

      event.start = '10:00:00'
      event.finish = '09:00:00'
      expect(event).to be_invalid

      event.start = '10:00:00'
      event.finish = '10:00:00'
      expect(event).to be_invalid
    end
  end
end
