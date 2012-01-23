require 'test_helper'

class StopControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
