require 'test_helper'

class IconThemesControllerTest < ActionController::TestCase
  setup do
    @icon_theme = icon_themes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:icon_themes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create icon_theme" do
    assert_difference('IconTheme.count') do
      post :create, :icon_theme => @icon_theme.attributes
    end

    assert_redirected_to icon_theme_path(assigns(:icon_theme))
  end

  test "should show icon_theme" do
    get :show, :id => @icon_theme.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @icon_theme.to_param
    assert_response :success
  end

  test "should update icon_theme" do
    put :update, :id => @icon_theme.to_param, :icon_theme => @icon_theme.attributes
    assert_redirected_to icon_theme_path(assigns(:icon_theme))
  end

  test "should destroy icon_theme" do
    assert_difference('IconTheme.count', -1) do
      delete :destroy, :id => @icon_theme.to_param
    end

    assert_redirected_to icon_themes_path
  end
end
