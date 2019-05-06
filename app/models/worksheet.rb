class Worksheet < ApplicationRecord
  belongs_to :athlete
  belongs_to :gym

  validates :athlete_id, presence: true
  validates :gym_id, presence: true
end
