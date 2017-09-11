require 'test_helper'

class LogPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get log_page_index_url
    assert_response :success
  end

end
