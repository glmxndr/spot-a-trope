require 'test_helper'

class OperaControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opera)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opus" do
    assert_difference('Opus.count') do
      post :create, :opus => { }
    end

    assert_redirected_to opus_path(assigns(:opus))
  end

  test "should show opus" do
    get :show, :id => opera(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => opera(:one).to_param
    assert_response :success
  end

  test "should update opus" do
    put :update, :id => opera(:one).to_param, :opus => { }
    assert_redirected_to opus_path(assigns(:opus))
  end

  test "should destroy opus" do
    assert_difference('Opus.count', -1) do
      delete :destroy, :id => opera(:one).to_param
    end

    assert_redirected_to opera_path
  end
end
