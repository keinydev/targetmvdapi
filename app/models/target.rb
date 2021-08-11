class Target < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  validates :title, :radius, :latitude, :longitude, :topic_id, presence: true
end
