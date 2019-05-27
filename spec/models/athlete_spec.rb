require 'rails_helper'

RSpec.describe Athlete, type: :model do
  
  describe 'Athlete navigation' do
    describe 'Creation' do
      before do
        @athlete = Athlete.create(username: "Valerio", email: "test@test.com", password: "password", password_confirmation: "password")
      end
      it 'should be able to be created if valid' do
        expect(@athlete).to be_valid
      end
  
      describe 'Validations' do
        it 'should not be valid without a username' do
          @athlete.username = nil
          expect(@athlete).to_not be_valid
        end
        it 'should not be valid without an email' do
          @athlete.email = nil
          expect(@athlete).to_not be_valid
        end
      end

      describe "Associations" do
        it "has many worksheets" do
          assc = described_class.reflect_on_association(:worksheets)
          expect(assc.macro).to eq :has_many
        end
        it "has many course_comments" do
          assc = described_class.reflect_on_association(:course_comments)
          expect(assc.macro).to eq :has_many
        end
        it "has many gym_reviews" do
          assc = described_class.reflect_on_association(:gym_reviews)
          expect(assc.macro).to eq :has_many
        end
        it " has_and_belongs_to_many gyms" do
          assc = described_class.reflect_on_association(:gyms)
          expect(assc.macro).to eq :has_and_belongs_to_many
        end
        it "has_and_belongs_to_many courses" do
          assc = described_class.reflect_on_association(:courses)
          expect(assc.macro).to eq :has_and_belongs_to_many
        end
        it "has_and_belongs_to_many coupons" do
          assc = described_class.reflect_on_association(:coupons)
          expect(assc.macro).to eq :has_and_belongs_to_many
        end
      end
    end
  end
end