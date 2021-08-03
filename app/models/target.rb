class Target < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  validates_presence_of :title, :radius, :latitude, :longitude, :topic_id
end
