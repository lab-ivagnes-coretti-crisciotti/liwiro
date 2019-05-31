class GymReview < ApplicationRecord
  belongs_to :gym
  belongs_to :athlete


  validates :gym, presence: true
  validates :athlete, presence: true
  validates :stars, numericality: { less_than_or_equal_to: 5,  only_integer: true }
  validates_uniqueness_of :athlete, scope: :gym_id
end
