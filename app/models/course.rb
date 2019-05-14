class Course < ApplicationRecord
  belongs_to :gym
  has_many :course_comments
  has_and_belongs_to_many :athletes

  validates :name, presence: true
  validates :gym_id, presence: true
end
