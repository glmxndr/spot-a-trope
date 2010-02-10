require 'test_helper'

class TropeTranslationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trope_translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trope_translation" do
    assert_difference('TropeTranslation.count') do
      post :create, :trope_translation => { }
    end

    assert_redirected_to trope_translation_path(assigns(:trope_translation))
  end

  test "should show trope_translation" do
    get :show, :id => trope_translations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => trope_translations(:one).to_param
    assert_response :success
  end

  test "should update trope_translation" do
    put :update, :id => trope_translations(:one).to_param, :trope_translation => { }
    assert_redirected_to trope_translation_path(assigns(:trope_translation))
  end

  test "should destroy trope_translation" do
    assert_difference('TropeTranslation.count', -1) do
      delete :destroy, :id => trope_translations(:one).to_param
    end

    assert_redirected_to trope_translations_path
  end
end
