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
class Conversation < ApplicationRecord
  belongs_to :user_a, foreign_key: :user_a_id, class_name: "User"
  belongs_to :user_b, foreign_key: :user_b_id, class_name: "User"

  has_many :messages, dependent: :destroy

  validates :user_a, uniqueness: {scope: :user_b}

  scope :between, -> (user_a, user_b) do
    where("(conversations.user_a_id = :user_a_id AND conversations.user_b_id = :user_b_id) OR (conversations.user_a_id = :user_b_id AND conversations.user_b_id = :user_a_id)", user_a_id: user_a, user_b_id: user_b)
  end

  scope :by_user, -> (user) do
    where("(conversations.user_a_id = :user OR conversations.user_b_id = :user)", user: user)
  end
end
