require 'test_helper'

class WelcomeDeck2016sControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
