require 'test_helper'

class RelationshipsControllerTest < ActionController::TestCase
  include SessionsHelper

  def setup
    @user = users(:one)
    @other_user = users(:two)
    sign_in @user
  end

  test "creating a relationship with Ajax" do
    old_count = Relationship.count
    xhr :post, :create, relationship: { followed_id: @other_user.id }
    assert_equal old_count + 1, Relationship.count
    assert_response :success
  end

  test "destroying a relationship with Ajax" do
    @user.follow!(@other_user)
    relationship = @user.relationships.find_by(followed_id: @other_user.id)
    old_count = Relationship.count
    xhr :delete, :destroy, id: relationship.id

    assert_equal old_count - 1, Relationship.count
    assert_response :success
  end
end
