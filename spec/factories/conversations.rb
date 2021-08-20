# == Schema Information
#
# Table name: conversations
#
#  id         :bigint           not null, primary key
#  user_a_id  :integer
#  user_b_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'faker'

FactoryBot.define do
  factory :conversation do
    user_a_id             { 1 }
    user_b_id             { 2 }
  end
end
