require 'test_helper'

class ColorThemesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ColorTheme.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ColorTheme.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ColorTheme.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to color_theme_url(assigns(:color_theme))
  end

  def test_edit
    get :edit, :id => ColorTheme.first
    assert_template 'edit'
  end

  def test_update_invalid
    ColorTheme.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ColorTheme.first
    assert_template 'edit'
  end

  def test_update_valid
    ColorTheme.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ColorTheme.first
    assert_redirected_to color_theme_url(assigns(:color_theme))
  end

  def test_destroy
    color_theme = ColorTheme.first
    delete :destroy, :id => color_theme
    assert_redirected_to color_themes_url
    assert !ColorTheme.exists?(color_theme.id)
  end
end
