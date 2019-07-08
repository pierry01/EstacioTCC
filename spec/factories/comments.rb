FactoryBot.define do
  factory :comment do
    user { User.create!(
      email: 'abc@def.ghi',
      password: 123456,
      password_confirmation: 123456
    )}
    
    event { Event.create!(
      title: 'Título',
      description: 'Descrição',
      start: '10:00:00',
      finish: '11:00:00'
    )}
    
    body { Faker::Lorem.paragraph }
  end
end
