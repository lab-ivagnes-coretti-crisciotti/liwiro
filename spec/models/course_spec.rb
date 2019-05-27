require 'rails_helper'

RSpec.describe Course, type: :model do
    describe 'Course navigation' do
        describe 'Creation' do
          before do
            @gym = Gym.create(username: "Gym1", email: "test@test.com", password: "password", password_confirmation: "password")
            @course = Course.create(name: "Course1", gym_id: @gym.id)
          end
          it 'should be able to be created if valid' do
            expect(@course).to be_valid
          end
      
          describe 'Validations' do
            it 'should not be valid without a name' do
              @course.name = nil
              expect(@course).to_not be_valid
            end
            it 'should not be valid without a gym' do
              @course.gym = nil
              expect(@course).to_not be_valid
            end
          end
    
          describe "Associations" do
            it "belongs to gym" do
              assc = described_class.reflect_on_association(:gym)
              expect(assc.macro).to eq :belongs_to
            end
            it "has many to course_comments" do
              assc = described_class.reflect_on_association(:course_comments)
              expect(assc.macro).to eq :has_many
            end
            it "has and belongs to many to athletes" do
              assc = described_class.reflect_on_association(:athletes)
              expect(assc.macro).to eq :has_and_belongs_to_many
            end
          end
        end
      end
end
