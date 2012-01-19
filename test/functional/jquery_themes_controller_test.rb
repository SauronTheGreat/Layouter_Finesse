require 'test_helper'

class JqueryThemesControllerTest < ActionController::TestCase
  setup do
    @jquery_theme = jquery_themes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jquery_themes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jquery_theme" do
    assert_difference('JqueryTheme.count') do
      post :create, :jquery_theme => @jquery_theme.attributes
    end

    assert_redirected_to jquery_theme_path(assigns(:jquery_theme))
  end

  test "should show jquery_theme" do
    get :show, :id => @jquery_theme.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @jquery_theme.to_param
    assert_response :success
  end

  test "should update jquery_theme" do
    put :update, :id => @jquery_theme.to_param, :jquery_theme => @jquery_theme.attributes
    assert_redirected_to jquery_theme_path(assigns(:jquery_theme))
  end

  test "should destroy jquery_theme" do
    assert_difference('JqueryTheme.count', -1) do
      delete :destroy, :id => @jquery_theme.to_param
    end

    assert_redirected_to jquery_themes_path
  end
end
