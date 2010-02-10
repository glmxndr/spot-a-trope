require 'test_helper'

class TropesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tropes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trope" do
    assert_difference('Trope.count') do
      post :create, :trope => { }
    end

    assert_redirected_to trope_path(assigns(:trope))
  end

  test "should show trope" do
    get :show, :id => tropes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tropes(:one).to_param
    assert_response :success
  end

  test "should update trope" do
    put :update, :id => tropes(:one).to_param, :trope => { }
    assert_redirected_to trope_path(assigns(:trope))
  end

  test "should destroy trope" do
    assert_difference('Trope.count', -1) do
      delete :destroy, :id => tropes(:one).to_param
    end

    assert_redirected_to tropes_path
  end
end
