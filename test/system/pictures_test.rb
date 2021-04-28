require "application_system_test_case"

class PicturesTest < ApplicationSystemTestCase
  setup do
    @picture = pictures(:one)
  end

  test "visiting the index" do
    visit pictures_url
    assert_selector "h1", text: "Pictures"
  end

  test "creating a Picture" do
    visit pictures_url
    click_on "New Picture"

    fill_in "Exif", with: @picture.exif
    fill_in "Extension", with: @picture.extension
    fill_in "Filename", with: @picture.filename
    fill_in "Filesystem date", with: @picture.filesystem_date
    fill_in "Full path", with: @picture.full_path
    fill_in "Meta", with: @picture.meta
    fill_in "Path", with: @picture.path_id
    fill_in "Picture date", with: @picture.picture_date
    check "Raw" if @picture.raw
    fill_in "Size", with: @picture.size
    fill_in "Thumb200", with: @picture.thumb200
    fill_in "Thumb400", with: @picture.thumb400
    fill_in "Thumb800", with: @picture.thumb800
    check "Will organize" if @picture.will_organize
    check "Will research" if @picture.will_research
    click_on "Create Picture"

    assert_text "Picture was successfully created"
    click_on "Back"
  end

  test "updating a Picture" do
    visit pictures_url
    click_on "Edit", match: :first

    fill_in "Exif", with: @picture.exif
    fill_in "Extension", with: @picture.extension
    fill_in "Filename", with: @picture.filename
    fill_in "Filesystem date", with: @picture.filesystem_date
    fill_in "Full path", with: @picture.full_path
    fill_in "Meta", with: @picture.meta
    fill_in "Path", with: @picture.path_id
    fill_in "Picture date", with: @picture.picture_date
    check "Raw" if @picture.raw
    fill_in "Size", with: @picture.size
    fill_in "Thumb200", with: @picture.thumb200
    fill_in "Thumb400", with: @picture.thumb400
    fill_in "Thumb800", with: @picture.thumb800
    check "Will organize" if @picture.will_organize
    check "Will research" if @picture.will_research
    click_on "Update Picture"

    assert_text "Picture was successfully updated"
    click_on "Back"
  end

  test "destroying a Picture" do
    visit pictures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Picture was successfully destroyed"
  end
end
