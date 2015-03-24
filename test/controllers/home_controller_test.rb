require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  it "should get index" do
    get :index
    assert_response :success
  end

end
