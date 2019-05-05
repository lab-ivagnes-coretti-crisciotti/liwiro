require "application_system_test_case"

class WorksheetsTest < ApplicationSystemTestCase
  setup do
    @worksheet = worksheets(:one)
  end

  test "visiting the index" do
    visit worksheets_url
    assert_selector "h1", text: "Worksheets"
  end

  test "creating a Worksheet" do
    visit worksheets_url
    click_on "New Worksheet"

    fill_in "Comments", with: @worksheet.comments
    click_on "Create Worksheet"

    assert_text "Worksheet was successfully created"
    click_on "Back"
  end

  test "updating a Worksheet" do
    visit worksheets_url
    click_on "Edit", match: :first

    fill_in "Comments", with: @worksheet.comments
    click_on "Update Worksheet"

    assert_text "Worksheet was successfully updated"
    click_on "Back"
  end

  test "destroying a Worksheet" do
    visit worksheets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Worksheet was successfully destroyed"
  end
end
