# == Schema Information
#
# Table name: benefits
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  price      :decimal(, )      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'faker'

FactoryBot.define do
  factory :benefit do
    name               { Faker::Lorem.unique.word }
    price              { Faker::Commerce.price }
  end
end
