require 'rails_helper'

RSpec.describe CourseComment, type: :model do
  describe 'CourseComment navigation' do
    describe 'Creation' do
      before do
        @gym = Gym.create(username: "Gym1", email: "test@test.com", password: "password", password_confirmation: "password")
        @athlete = Athlete.create(username: "Valerio", email: "test@test.com", password: "password", password_confirmation: "password")
        @course = Course.create(name: "Course1", gym_id: @gym.id)
        @course_comment = CourseComment.create(text: "test1", athlete_id: @athlete.id, course_id: @course.id)
      end
      it 'should be able to be created if valid' do
        expect(@course_comment).to be_valid
      end
  
      describe 'Validations' do
        it 'should not be valid without an athlete' do
          @course_comment.athlete = nil
          expect(@course_comment).to_not be_valid
        end
        it 'should not be valid without a course' do
          @course_comment.course = nil
          expect(@course_comment).to_not be_valid
        end
      end

      describe "Associations" do
        it "belongs to athlete" do
          assc = described_class.reflect_on_association(:athlete)
          expect(assc.macro).to eq :belongs_to
        end
        it "belongs to course" do
          assc = described_class.reflect_on_association(:course)
          expect(assc.macro).to eq :belongs_to
        end
      end
    end
  end
end
