class AthletesCoupon < ApplicationRecord
  belongs_to :athlete
  belongs_to :coupon
end
