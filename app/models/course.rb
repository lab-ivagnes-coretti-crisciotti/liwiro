class Course < ApplicationRecord
  belongs_to :gym
  has_many :course_comments
  has_and_belongs_to_many :athletes

  validates :name, presence: true
  validates :gym_id, presence: true
  #validates :price, presence: true

  def already_joined(course, current_athlete)
    @course = Course.where(id: course.id).first
    if current_athlete.courses.include?(@course)
      true
    else false 
    end
  end
end
