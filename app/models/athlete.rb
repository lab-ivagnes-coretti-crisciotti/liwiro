class Athlete < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :worksheets
  has_and_belongs_to_many :gyms
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :coupons

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
