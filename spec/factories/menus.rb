require 'faker'

FactoryBot.define do
  factory :menu do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.decimal(2) }
  end
end
