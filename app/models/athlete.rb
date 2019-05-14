class Athlete < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :worksheets
  has_many :course_comments
  has_many :gym_reviews
  has_and_belongs_to_many :gyms
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :coupons

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  validates :username, presence: true
  validates :email, presence: true

  def self.from_omniauth(auth)
    athlete = Athlete.where(provider: auth.provider, uid: auth.uid).first
    if athlete.present?
      athlete
    else
      # Check wether theres is already a user with the same
      # email address
      athlete_with_email = Athlete.find_by_email(auth.extra.raw_info.email)

      if athlete_with_email.present?
        athlete = athlete_with_email
      else

        athlete = Athlete.new

        if auth.provider == "facebook"
          athlete.provider = auth.provider
          athlete.uid = auth.uid
          athlete.name = auth.info.username
          athlete.lastname = auth.info.name
          athlete.email = auth.info.email
          athlete.password = Devise.friendly_token[0,20]
          athlete.save!
        elsif auth.provider == "google_oauth2"
          athlete.provider = auth.provider
          athlete.uid = auth.uid
          athlete.name = auth.info.first_name
          athlete.lastname = auth.info.last_name
          athlete.email = auth.info.email
          athlete.password = Devise.friendly_token[0,20]
          athlete.save!
        end

      end
    end
    return athlete
  end

end
