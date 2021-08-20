require 'faker'

FactoryBot.define do
  factory :conversation do
    user_a_id             { 1 }
    user_b_id             { 2 }
  end
end
