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
require 'rails_helper'

describe Message, type: :model do

  let(:user_a) { create(:user) }

  let(:user_b) { create(:user) }

  let(:user_x) { create(:user) }

  let!(:conversation) { create(:conversation, user_a: user_a, user_b: user_b) }

  let(:message) { build(:message, user_id: user_x.id, conversation_id: conversation.id) }

  describe 'callbacks' do 
    context 'when user does not belong in the conversation' do

      it 'returns message is not valid' do
        message.save
        expect(message).to be_invalid
        expect(message.errors[:conversation]).not_to be_empty
      end
    end
  end
end
