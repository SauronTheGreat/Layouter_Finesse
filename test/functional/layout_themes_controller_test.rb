require 'test_helper'

class LayoutThemesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => LayoutTheme.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    LayoutTheme.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    LayoutTheme.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to layout_theme_url(assigns(:layout_theme))
  end

  def test_edit
    get :edit, :id => LayoutTheme.first
    assert_template 'edit'
  end

  def test_update_invalid
    LayoutTheme.any_instance.stubs(:valid?).returns(false)
    put :update, :id => LayoutTheme.first
    assert_template 'edit'
  end

  def test_update_valid
    LayoutTheme.any_instance.stubs(:valid?).returns(true)
    put :update, :id => LayoutTheme.first
    assert_redirected_to layout_theme_url(assigns(:layout_theme))
  end

  def test_destroy
    layout_theme = LayoutTheme.first
    delete :destroy, :id => layout_theme
    assert_redirected_to layout_themes_url
    assert !LayoutTheme.exists?(layout_theme.id)
  end
end
