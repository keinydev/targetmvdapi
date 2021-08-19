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

  validates :user_a, uniqueness: {scope: :user_b}

  scope :between, -> (user_a_id, user_b_id) do
    where("(conversations.user_a_id = ? AND conversations.user_b_id = ?) OR (conversations.user_a_id = ? AND conversations.user_b_id = ?)", user_a_id, user_b_id, user_b_id, user_a_id)
  end

  scope :by_user, -> (user) do
    where("(conversations.user_a_id = ? OR conversations.user_b_id = ?)", user, user)
  end
end
