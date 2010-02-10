require 'test_helper'

class TocentriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tocentries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tocentry" do
    assert_difference('Tocentry.count') do
      post :create, :tocentry => { }
    end

    assert_redirected_to tocentry_path(assigns(:tocentry))
  end

  test "should show tocentry" do
    get :show, :id => tocentries(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tocentries(:one).to_param
    assert_response :success
  end

  test "should update tocentry" do
    put :update, :id => tocentries(:one).to_param, :tocentry => { }
    assert_redirected_to tocentry_path(assigns(:tocentry))
  end

  test "should destroy tocentry" do
    assert_difference('Tocentry.count', -1) do
      delete :destroy, :id => tocentries(:one).to_param
    end

    assert_redirected_to tocentries_path
  end
end
