# == Schema Information
#
# Table name: targets
#
#  id         :bigint           not null, primary key
#  title      :string
#  radius     :decimal(, )
#  latitude   :decimal(, )
#  longitude  :decimal(, )
#  topic_id   :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'faker'

FactoryBot.define do
  factory :target do
    title              { Faker::Lorem.unique.word }
    radius             { rand(1..10) } 
    latitude           { rand(-180.0..180.0) } 
    longitude          { rand(-180.0..180.0) } 
    association        :topic
  end
end
