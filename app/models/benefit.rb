class Benefit < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
