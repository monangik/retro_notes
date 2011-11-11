require 'test_helper'

class RetrosControllerTest < ActionController::TestCase
  setup do
    @retro = retros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:retros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create retro" do
    assert_difference('Retro.count') do
      post :create, retro: @retro.attributes
    end

    assert_redirected_to retro_path(assigns(:retro))
  end

  test "should show retro" do
    get :show, id: @retro.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @retro.to_param
    assert_response :success
  end

  test "should update retro" do
    put :update, id: @retro.to_param, retro: @retro.attributes
    assert_redirected_to retro_path(assigns(:retro))
  end

  test "should destroy retro" do
    assert_difference('Retro.count', -1) do
      delete :destroy, id: @retro.to_param
    end

    assert_redirected_to retros_path
  end
end
