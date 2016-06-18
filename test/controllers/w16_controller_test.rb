require 'test_helper'

class W16ControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
