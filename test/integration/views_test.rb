require "test_helper"
class ViewsTest < ActionDispatch::IntegrationTest
  test "visiting a link records a view" do
    link = links(:one)
    original_views_count = link.views_count
    assert_difference "View.count" do
      assert_difference "link.views_count" do
        get view_path(link)
        assert_response :redirect
        link.reload

      end
    end

  end

  test "visiting a link redirects to the URL" do
    link = links(:one)
    get view_path(link)
    assert_response :redirect
    assert_redirected_to link.url , allow_other_host: true
  end
end
