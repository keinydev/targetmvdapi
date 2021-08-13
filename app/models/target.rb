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
class Target < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  validates :title, :radius, :latitude, :longitude, :topic_id, presence: true
  
  validate :user_max_targets, on: :create

  def user_max_targets
    errors.add(:targets, "You are allowed to create only 3 targets") if user.targets.length >= 3
  end
end
