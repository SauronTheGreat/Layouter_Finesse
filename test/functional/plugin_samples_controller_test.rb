require 'test_helper'

class PluginSamplesControllerTest < ActionController::TestCase
  setup do
    @plugin_sample = plugin_samples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plugin_samples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plugin_sample" do
    assert_difference('PluginSample.count') do
      post :create, :plugin_sample => @plugin_sample.attributes
    end

    assert_redirected_to plugin_sample_path(assigns(:plugin_sample))
  end

  test "should show plugin_sample" do
    get :show, :id => @plugin_sample.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @plugin_sample.to_param
    assert_response :success
  end

  test "should update plugin_sample" do
    put :update, :id => @plugin_sample.to_param, :plugin_sample => @plugin_sample.attributes
    assert_redirected_to plugin_sample_path(assigns(:plugin_sample))
  end

  test "should destroy plugin_sample" do
    assert_difference('PluginSample.count', -1) do
      delete :destroy, :id => @plugin_sample.to_param
    end

    assert_redirected_to plugin_samples_path
  end
end
