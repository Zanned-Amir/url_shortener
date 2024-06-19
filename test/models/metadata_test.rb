require "test_helper"

class MetadataTest < ActiveSupport::TestCase
  test "title attribute" do
    assert_equal "Test", Metadata.new("<title>Test</title>").title
  end
  test "missing title attribute" do
    assert_nil Metadata.new.title
  end
  test "meta description" do
  assert_equal "Test", Metadata.new("<meta name='description' content='Test'>").description
  end
  test "missing meta description" do
    assert_nil Metadata.new.description
  end
   test "meta image" do
    assert_equal "http://example.com/image.jpg", Metadata.new("<meta property='og:image' content='http://example.com/image.jpg'>").image
  end
  test "missing meta image" do
    assert_nil Metadata.new.image
  end
end
