class GymReview < ApplicationRecord
  belongs_to :athlete
  belongs_to :gym

  validates :athlete, presence: true
  validates :gym, presence: true 
end
