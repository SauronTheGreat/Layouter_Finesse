require 'test_helper'

class FactoryVendorsControllerTest < ActionController::TestCase
  setup do
    @factory_vendor = factory_vendors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:factory_vendors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create factory_vendor" do
    assert_difference('FactoryVendor.count') do
      post :create, factory_vendor: @factory_vendor.attributes
    end

    assert_redirected_to factory_vendor_path(assigns(:factory_vendor))
  end

  test "should show factory_vendor" do
    get :show, id: @factory_vendor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @factory_vendor.to_param
    assert_response :success
  end

  test "should update factory_vendor" do
    put :update, id: @factory_vendor.to_param, factory_vendor: @factory_vendor.attributes
    assert_redirected_to factory_vendor_path(assigns(:factory_vendor))
  end

  test "should destroy factory_vendor" do
    assert_difference('FactoryVendor.count', -1) do
      delete :destroy, id: @factory_vendor.to_param
    end

    assert_redirected_to factory_vendors_path
  end
end
