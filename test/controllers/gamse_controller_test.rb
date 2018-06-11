require 'test_helper'

class GamseControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get gamse_new_url
    assert_response :success
  end

  test "should get score" do
    get gamse_score_url
    assert_response :success
  end

end
