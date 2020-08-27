require "application_system_test_case"

class GardensTest < ApplicationSystemTestCase
  setup do
    @garden = gardens(:one)
  end

  test "visiting the index" do
    visit gardens_url
    assert_selector "h1", text: "Gardens"
  end

  test "creating a Garden" do
    visit gardens_url
    click_on "New Garden"

    fill_in "Banner url", with: @garden.banner_url
    fill_in "Name", with: @garden.name
    click_on "Create Garden"

    assert_text "Garden was successfully created"
    click_on "Back"
  end

  test "updating a Garden" do
    visit gardens_url
    click_on "Edit", match: :first

    fill_in "Banner url", with: @garden.banner_url
    fill_in "Name", with: @garden.name
    click_on "Update Garden"

    assert_text "Garden was successfully updated"
    click_on "Back"
  end

  test "destroying a Garden" do
    visit gardens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Garden was successfully destroyed"
  end
end
