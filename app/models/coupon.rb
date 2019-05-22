class Coupon < ApplicationRecord
  belongs_to :gym
  has_and_belongs_to_many :athletes

  validates :name, presence: true
  validates :code, presence: true
  validates :gym_id, presence: true

  def already_joined(coupon, current_athlete)
    @coupon = Coupon.where(id: coupon.id).first
    if current_athlete.coupons.include?(@coupon)
      true
    else false
    end
  end

end
