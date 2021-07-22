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
#
class User < ApplicationRecord
  extend Devise::Models

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User
  
  before_validation :set_uid

  def set_uid 
    self[:uid] = self[:email] if self[:uid].blank? && self[:provider] == 'email'
  end
end
