require 'faker'
# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  image      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :topic do
    name               { Faker::Lorem.unique.word }
    image              { Faker::LoremFlickr.image } 
  end
end
