require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get adminIndex" do
    get admin_adminIndex_url
    assert_response :success
  end

end
