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

  let!(:target_list) { create_list(:target, 3, user: user, topic: topic_list.first) }

  let(:target) { Target.create(title: 'This cannot be created', radius: 5, latitude: 6.244203, longitude: -75.581215, topic_id: topic_list.first.id, user_id: user.id) }

  describe 'callbacks' do 
    context 'when user add more than 3 targets' do
      before do
        target
      end

      it 'returns target not is valid' do  
        expect(target).not_to be_valid
      end
    end
  end
end
