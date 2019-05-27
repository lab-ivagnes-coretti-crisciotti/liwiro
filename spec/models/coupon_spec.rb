require 'rails_helper'

RSpec.describe Coupon, type: :model do
  describe 'Coupon navigation' do
    describe 'Creation' do
      before do
        @gym = Gym.create(username: "Gym1", email: "test@test.com", password: "password", password_confirmation: "password")
        @coupon = Coupon.create(code: "test1", name: "test1", gym_id: @gym.id)
      end
      it 'should be able to be created if valid' do
        expect(@coupon).to be_valid
      end
  
      describe 'Validations' do
        it 'should not be valid without a code' do
          @coupon.code = nil
          expect(@coupon).to_not be_valid
        end
        it 'should not be valid without an name' do
          @coupon.name = nil
          expect(@coupon).to_not be_valid
        end
        it 'should not be valid without an gym_id' do
          @coupon.gym_id = nil
          expect(@coupon).to_not be_valid
        end
      end

      describe "Associations" do
        it "belongs to gym" do
          assc = described_class.reflect_on_association(:gym)
          expect(assc.macro).to eq :belongs_to
        end
        it "has and belongs to many athletes" do
          assc = described_class.reflect_on_association(:athletes)
          expect(assc.macro).to eq :has_and_belongs_to_many
        end
      end
    end
  end
end
