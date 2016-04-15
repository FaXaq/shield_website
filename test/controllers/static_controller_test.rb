require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get aboutus" do
    get :aboutus
    assert_response :success
  end

  test "should get events" do
    get :events
    assert_response :success
  end

end
