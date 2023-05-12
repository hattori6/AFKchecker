require "test_helper"

class Admin::FeelingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_feelings_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_feelings_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_feelings_show_url
    assert_response :success
  end
end
