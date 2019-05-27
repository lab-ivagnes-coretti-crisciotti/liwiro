require 'rails_helper'

RSpec.describe Gym, type: :model do
    describe 'gym navigation' do
        describe 'Creation' do
            before do
                @gym = Gym.create(username: "Gym1", email: "test@test.com", password: "password", password_confirmation: "password")
            end
            it 'should be able to be created if valid' do
                expect(@gym).to be_valid
            end
        
            describe 'Validations' do
                it 'should not be valid without a username' do
                    @gym.username = nil
                    expect(@gym).to_not be_valid
                end
                it 'should not be valid without an email' do
                    @gym.email = nil
                    expect(@gym).to_not be_valid
                end
            end
        end
        describe "Associations" do
            it "has many worksheets" do
                assc = described_class.reflect_on_association(:worksheets)
                expect(assc.macro).to eq :has_many
            end
            it "has many courses" do
                assc = described_class.reflect_on_association(:courses)
                expect(assc.macro).to eq :has_many
            end
            it "has many coupons" do
                assc = described_class.reflect_on_association(:coupons)
                expect(assc.macro).to eq :has_many
            end
            it " has_many gym_reviews" do
                assc = described_class.reflect_on_association(:gym_reviews)
                expect(assc.macro).to eq :has_many
            end
            it "has_and_belongs_to_many athletes" do
                assc = described_class.reflect_on_association(:athletes)
                expect(assc.macro).to eq :has_and_belongs_to_many
            end
        end
    end
end
