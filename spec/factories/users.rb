require 'faker'
# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  gender                 :string
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  tokens                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  allow_password_change  :boolean          default(FALSE), not null
#
FactoryBot.define do
  factory :user do
    email                  { Faker::Internet.unique.email }
    password               { Faker::Internet.password(min_length: 8) } 
    gender                 { Faker::Gender.binary_type } 
    uid                    { email }
  end
end
