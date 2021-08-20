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
class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :body, :conversation_id, presence: true

  validate :restrict_conversation_access, on: :create

  def restrict_conversation_access
    unless conversation.user_a == self.user || conversation.user_b == self.user
      errors.add(:conversation, "Access denied")
    end
  end
end
