class AthletesGym < ApplicationRecord
  belongs_to :athlete
  belongs_to :gym
end
