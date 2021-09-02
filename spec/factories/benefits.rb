require 'faker'

FactoryBot.define do
  factory :benefit do
    name               { Faker::Lorem.unique.word }
    price              { Faker::Commerce.price }
  end
end
