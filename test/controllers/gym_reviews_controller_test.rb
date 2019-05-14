require 'test_helper'

class GymReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gym_review = gym_reviews(:one)
  end

  test "should get index" do
    get gym_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_gym_review_url
    assert_response :success
  end

  test "should create gym_review" do
    assert_difference('GymReview.count') do
      post gym_reviews_url, params: { gym_review: { athlete_id: @gym_review.athlete_id, gym_id: @gym_review.gym_id, text: @gym_review.text } }
    end

    assert_redirected_to gym_review_url(GymReview.last)
  end

  test "should show gym_review" do
    get gym_review_url(@gym_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_gym_review_url(@gym_review)
    assert_response :success
  end

  test "should update gym_review" do
    patch gym_review_url(@gym_review), params: { gym_review: { athlete_id: @gym_review.athlete_id, gym_id: @gym_review.gym_id, text: @gym_review.text } }
    assert_redirected_to gym_review_url(@gym_review)
  end

  test "should destroy gym_review" do
    assert_difference('GymReview.count', -1) do
      delete gym_review_url(@gym_review)
    end

    assert_redirected_to gym_reviews_url
  end
end
