require 'test_helper'

class KindleFilesControllerTest < ActionController::TestCase
  setup do
    @kindle_file = kindle_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kindle_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kindle_file" do
    assert_difference('KindleFile.count') do
      post :create, :kindle_file => @kindle_file.attributes
    end

    assert_redirected_to kindle_file_path(assigns(:kindle_file))
  end

  test "should show kindle_file" do
    get :show, :id => @kindle_file.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @kindle_file.to_param
    assert_response :success
  end

  test "should update kindle_file" do
    put :update, :id => @kindle_file.to_param, :kindle_file => @kindle_file.attributes
    assert_redirected_to kindle_file_path(assigns(:kindle_file))
  end

  test "should destroy kindle_file" do
    assert_difference('KindleFile.count', -1) do
      delete :destroy, :id => @kindle_file.to_param
    end

    assert_redirected_to kindle_files_path
  end
end
