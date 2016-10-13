require 'test_helper'

class BlockTimesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get block_times_create_url
    assert_response :success
  end

  test "should get new" do
    get block_times_new_url
    assert_response :success
  end

  test "should get edit" do
    get block_times_edit_url
    assert_response :success
  end

  test "should get update" do
    get block_times_update_url
    assert_response :success
  end

  test "should get destroy" do
    get block_times_destroy_url
    assert_response :success
  end

end
