require "application_system_test_case"

class HearingsTest < ApplicationSystemTestCase
  setup do
    @hearing = hearings(:one)
  end

  test "visiting the index" do
    visit hearings_url
    assert_selector "h1", text: "Hearings"
  end

  test "creating a Hearing" do
    visit hearings_url
    click_on "New Hearing"

    click_on "Create Hearing"

    assert_text "Hearing was successfully created"
    click_on "Back"
  end

  test "updating a Hearing" do
    visit hearings_url
    click_on "Edit", match: :first

    click_on "Update Hearing"

    assert_text "Hearing was successfully updated"
    click_on "Back"
  end

  test "destroying a Hearing" do
    visit hearings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hearing was successfully destroyed"
  end
end
