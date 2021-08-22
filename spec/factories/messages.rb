# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  body            :text
#  conversation_id :bigint           not null
#  user_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'faker'

FactoryBot.define do
  factory :message do
    body                { Faker::Lorem.question }
    user_id             { 1 }
    conversation_id     { 1 }
  end
end
