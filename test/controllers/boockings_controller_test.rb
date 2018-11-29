require 'test_helper'

class BoockingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get boockings_create_url
    assert_response :success
  end

  test "should get index" do
    get boockings_index_url
    assert_response :success
  end

  test "should get approve" do
    get boockings_approve_url
    assert_response :success
  end

  test "should get reject" do
    get boockings_reject_url
    assert_response :success
  end

end
