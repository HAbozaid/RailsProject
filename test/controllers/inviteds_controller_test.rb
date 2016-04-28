require 'test_helper'

class InvitedsControllerTest < ActionController::TestCase
  setup do
    @invited = inviteds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inviteds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invited" do
    assert_difference('Invited.count') do
      post :create, invited: { order_id: @invited.order_id, user_id: @invited.user_id }
    end

    assert_redirected_to invited_path(assigns(:invited))
  end

  test "should show invited" do
    get :show, id: @invited
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invited
    assert_response :success
  end

  test "should update invited" do
    patch :update, id: @invited, invited: { order_id: @invited.order_id, user_id: @invited.user_id }
    assert_redirected_to invited_path(assigns(:invited))
  end

  test "should destroy invited" do
    assert_difference('Invited.count', -1) do
      delete :destroy, id: @invited
    end

    assert_redirected_to inviteds_path
  end
end
