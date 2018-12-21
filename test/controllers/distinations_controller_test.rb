require 'test_helper'

class DistinationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get distinations_index_url
    assert_response :success
  end

  test "should get show" do
    get distinations_show_url
    assert_response :success
  end

  test "should get new" do
    get distinations_new_url
    assert_response :success
  end

  test "should get create" do
    get distinations_create_url
    assert_response :success
  end

end
