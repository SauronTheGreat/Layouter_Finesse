require 'test_helper'

class PageLayoutsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => PageLayout.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    PageLayout.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    PageLayout.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to page_layout_url(assigns(:page_layout))
  end

  def test_edit
    get :edit, :id => PageLayout.first
    assert_template 'edit'
  end

  def test_update_invalid
    PageLayout.any_instance.stubs(:valid?).returns(false)
    put :update, :id => PageLayout.first
    assert_template 'edit'
  end

  def test_update_valid
    PageLayout.any_instance.stubs(:valid?).returns(true)
    put :update, :id => PageLayout.first
    assert_redirected_to page_layout_url(assigns(:page_layout))
  end

  def test_destroy
    page_layout = PageLayout.first
    delete :destroy, :id => page_layout
    assert_redirected_to page_layouts_url
    assert !PageLayout.exists?(page_layout.id)
  end
end
