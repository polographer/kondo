require "test_helper"

class PicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @picture = pictures(:one)
  end

  test "should get index" do
    get pictures_url
    assert_response :success
  end

  test "should get new" do
    get new_picture_url
    assert_response :success
  end

  test "should create picture" do
    assert_difference('Picture.count') do
      post pictures_url, params: { picture: { exif: @picture.exif, extension: @picture.extension, filename: @picture.filename, filesystem_date: @picture.filesystem_date, full_path: @picture.full_path, meta: @picture.meta, path_id: @picture.path_id, picture_date: @picture.picture_date, raw: @picture.raw, size: @picture.size, thumb200: @picture.thumb200, thumb400: @picture.thumb400, thumb800: @picture.thumb800, will_organize: @picture.will_organize, will_research: @picture.will_research } }
    end

    assert_redirected_to picture_url(Picture.last)
  end

  test "should show picture" do
    get picture_url(@picture)
    assert_response :success
  end

  test "should get edit" do
    get edit_picture_url(@picture)
    assert_response :success
  end

  test "should update picture" do
    patch picture_url(@picture), params: { picture: { exif: @picture.exif, extension: @picture.extension, filename: @picture.filename, filesystem_date: @picture.filesystem_date, full_path: @picture.full_path, meta: @picture.meta, path_id: @picture.path_id, picture_date: @picture.picture_date, raw: @picture.raw, size: @picture.size, thumb200: @picture.thumb200, thumb400: @picture.thumb400, thumb800: @picture.thumb800, will_organize: @picture.will_organize, will_research: @picture.will_research } }
    assert_redirected_to picture_url(@picture)
  end

  test "should destroy picture" do
    assert_difference('Picture.count', -1) do
      delete picture_url(@picture)
    end

    assert_redirected_to pictures_url
  end
end
