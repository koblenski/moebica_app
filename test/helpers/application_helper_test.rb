require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full_title" do
    assert_match /foo/, full_title("foo")
    assert_match /^Moebica - Learn Programming Together/, full_title("foo")
    assert_no_match /\|/, full_title("")
  end
end
