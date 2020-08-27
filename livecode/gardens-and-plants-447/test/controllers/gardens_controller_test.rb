require 'test_helper'

class GardensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @garden = gardens(:one)
  end

  test "should get index" do
    get gardens_url
    assert_response :success
  end

  test "should get new" do
    get new_garden_url
    assert_response :success
  end

  test "should create garden" do
    assert_difference('Garden.count') do
      post gardens_url, params: { garden: { banner_url: @garden.banner_url, name: @garden.name } }
    end

    assert_redirected_to garden_url(Garden.last)
  end

  test "should show garden" do
    get garden_url(@garden)
    assert_response :success
  end

  test "should get edit" do
    get edit_garden_url(@garden)
    assert_response :success
  end

  test "should update garden" do
    patch garden_url(@garden), params: { garden: { banner_url: @garden.banner_url, name: @garden.name } }
    assert_redirected_to garden_url(@garden)
  end

  test "should destroy garden" do
    assert_difference('Garden.count', -1) do
      delete garden_url(@garden)
    end

    assert_redirected_to gardens_url
  end
end
