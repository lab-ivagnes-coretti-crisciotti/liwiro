class Coupon < ApplicationRecord
  belongs_to :gym
  has_and_belongs_to_many :athletes

  validates :code, presence: true
  validates :gym_id, presence: true
end
