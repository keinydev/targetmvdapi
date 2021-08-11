class Target < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  validates :title, :radius, :latitude, :longitude, :topic_id, presence: true
  
  validate :user_max_targets

  def user_max_targets
    user = User.find(self.user_id)
    errors.add(:targets, "You are allowed to create only 3 targets") if user.targets.length >= 3
  end
end
