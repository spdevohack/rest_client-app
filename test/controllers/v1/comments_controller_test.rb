require "test_helper"

class V1::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get v1_comments_index_url
    assert_response :success
  end
end
