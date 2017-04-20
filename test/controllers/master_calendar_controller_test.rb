require 'test_helper'

class MasterCalendarControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get master_calendar_view_url
    assert_response :success
  end

end
