FactoryBot.define do
  factory :event do
    title { "MyString" }
    description { "MyText" }
    user { nil }
    start { "MyString" }
    finish { "MyString" }
  end
end
