require 'test_helper'

class PracticeControllerTest < ActionController::TestCase
  test "executing code with Ajax" do
    xhr :post, :create, practice: { code: "puts 'Hello, World!'" }
    assert_equal assigns(:code_output), "Hello, World!\n"
    assert_response :success
  end
end
