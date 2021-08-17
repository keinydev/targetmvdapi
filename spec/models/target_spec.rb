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
require 'rails_helper'

describe Target, type: :model do

  let(:user) { create(:user) }

  let(:topic_list) { create_list(:topic, 5) }   

  let!(:target_list) { create_list(:target, 3, user: user) }

  let(:target) { build(:target, user_id: user.id, topic_id: topic_list.first.id) }

  describe 'callbacks' do 
    context 'when user add more than 3 targets' do

      it 'returns target not is valid' do
        target.save 
        expect(target).to be_invalid
        expect(target.errors[:targets]).not_to be_empty
      end
    end
  end
end
