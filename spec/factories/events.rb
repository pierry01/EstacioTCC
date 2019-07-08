require 'faker'

FactoryBot.define do
  factory :event do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    start { DateTime.now + Random.rand(1..5) }
    finish { DateTime.now + Random.rand(6..10) }
  end
end
