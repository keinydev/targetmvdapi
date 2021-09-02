# == Schema Information
#
# Table name: benefits
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  price      :decimal(, )      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Benefit < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
