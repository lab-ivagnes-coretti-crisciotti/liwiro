require 'rails_helper'

RSpec.describe Worksheet, type: :model do
  describe 'Worksheet navigation' do
    describe 'Creation' do
      before do
        @gym = Gym.create(username: "Gym1", email: "test@test.com", password: "password", password_confirmation: "password")
        @athlete = Athlete.create(username: "Valerio", email: "test@test.com", password: "password", password_confirmation: "password")
        @worksheet = Worksheet.create(comments: "test1", athlete_id: @athlete.id, gym_id: @gym.id)
      end
      it 'should be able to be created if valid' do
        expect(@worksheet).to be_valid
      end
  
      describe 'Validations' do
        it 'should not be valid without an athlete' do
          @worksheet.athlete = nil
          expect(@worksheet).to_not be_valid
        end
        it 'should not be valid without a gym' do
          @worksheet.gym = nil
          expect(@worksheet).to_not be_valid
        end
      end

      describe "Associations" do
        it "belongs to athlete" do
          assc = described_class.reflect_on_association(:athlete)
          expect(assc.macro).to eq :belongs_to
        end
        it "belongs to gym" do
          assc = described_class.reflect_on_association(:gym)
          expect(assc.macro).to eq :belongs_to
        end
      end
    end
  end
end
