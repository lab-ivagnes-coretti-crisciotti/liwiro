require "application_system_test_case"

class CourseCommentsTest < ApplicationSystemTestCase
  setup do
    @course_comment = course_comments(:one)
  end

  test "visiting the index" do
    visit course_comments_url
    assert_selector "h1", text: "Course Comments"
  end

  test "creating a Course comment" do
    visit course_comments_url
    click_on "New Course Comment"

    fill_in "Athlete", with: @course_comment.athlete_id
    fill_in "Course", with: @course_comment.course_id
    fill_in "Text", with: @course_comment.text
    click_on "Create Course comment"

    assert_text "Course comment was successfully created"
    click_on "Back"
  end

  test "updating a Course comment" do
    visit course_comments_url
    click_on "Edit", match: :first

    fill_in "Athlete", with: @course_comment.athlete_id
    fill_in "Course", with: @course_comment.course_id
    fill_in "Text", with: @course_comment.text
    click_on "Update Course comment"

    assert_text "Course comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Course comment" do
    visit course_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course comment was successfully destroyed"
  end
end
