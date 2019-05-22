class Gym < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :worksheets
  has_many :coupons
  has_many :courses
  has_many :gym_reviews
  has_and_belongs_to_many :athletes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true

  def already_joined(gym, current_athlete)
    @gym = Gym.where(id: gym.id).first
    if current_athlete.gyms.include?(@gym)
      true
    else false
    end
  end
end
