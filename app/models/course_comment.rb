class CourseComment < ApplicationRecord
  belongs_to :athlete
  belongs_to :course

  validates :athlete, presence: true
  validates :course, presence: true 
end
