require 'test_helper'

class FontThemesControllerTest < ActionController::TestCase
  setup do
    @font_theme = font_themes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:font_themes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create font_theme" do
    assert_difference('FontTheme.count') do
      post :create, :font_theme => @font_theme.attributes
    end

    assert_redirected_to font_theme_path(assigns(:font_theme))
  end

  test "should show font_theme" do
    get :show, :id => @font_theme.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @font_theme.to_param
    assert_response :success
  end

  test "should update font_theme" do
    put :update, :id => @font_theme.to_param, :font_theme => @font_theme.attributes
    assert_redirected_to font_theme_path(assigns(:font_theme))
  end

  test "should destroy font_theme" do
    assert_difference('FontTheme.count', -1) do
      delete :destroy, :id => @font_theme.to_param
    end

    assert_redirected_to font_themes_path
  end
end
