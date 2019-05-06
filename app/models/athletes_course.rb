class AthletesCourse < ApplicationRecord
  belongs_to :athlete
  belongs_to :course
end
