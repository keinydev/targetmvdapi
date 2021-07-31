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
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'callbacks' do 
    context 'validation before saving the user' do
      
      let!(:user) { create(:user, uid: '') }
      
      it 'set uid as email' do
        expect(user.uid).to eq(user.email)
      end
    end
  end
end
