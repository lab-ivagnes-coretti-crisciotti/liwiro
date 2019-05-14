require "application_system_test_case"

class GymReviewsTest < ApplicationSystemTestCase
  setup do
    @gym_review = gym_reviews(:one)
  end

  test "visiting the index" do
    visit gym_reviews_url
    assert_selector "h1", text: "Gym Reviews"
  end

  test "creating a Gym review" do
    visit gym_reviews_url
    click_on "New Gym Review"

    fill_in "Athlete", with: @gym_review.athlete_id
    fill_in "Gym", with: @gym_review.gym_id
    fill_in "Text", with: @gym_review.text
    click_on "Create Gym review"

    assert_text "Gym review was successfully created"
    click_on "Back"
  end

  test "updating a Gym review" do
    visit gym_reviews_url
    click_on "Edit", match: :first

    fill_in "Athlete", with: @gym_review.athlete_id
    fill_in "Gym", with: @gym_review.gym_id
    fill_in "Text", with: @gym_review.text
    click_on "Update Gym review"

    assert_text "Gym review was successfully updated"
    click_on "Back"
  end

  test "destroying a Gym review" do
    visit gym_reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gym review was successfully destroyed"
  end
end
