require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get maps" do
    get home_maps_url
    assert_response :success
  end

end
