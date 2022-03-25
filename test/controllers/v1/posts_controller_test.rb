require "test_helper"

class V1::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get v1_posts_index_url
    assert_response :success
  end
end
