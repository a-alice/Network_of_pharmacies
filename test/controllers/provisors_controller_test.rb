require 'test_helper'

class ProvisorsControllerTest < ActionController::TestCase
  setup do
    @provisor = provisors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provisors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create provisor" do
    assert_difference('Provisor.count') do
      post :create, provisor: { birthday: @provisor.birthday, fathername: @provisor.fathername, inn: @provisor.inn, name: @provisor.name, passport: @provisor.passport, pharmacy_id: @provisor.pharmacy_id, surname: @provisor.surname }
    end

    assert_redirected_to provisor_path(assigns(:provisor))
  end

  test "should show provisor" do
    get :show, id: @provisor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @provisor
    assert_response :success
  end

  test "should update provisor" do
    patch :update, id: @provisor, provisor: { birthday: @provisor.birthday, fathername: @provisor.fathername, inn: @provisor.inn, name: @provisor.name, passport: @provisor.passport, pharmacy_id: @provisor.pharmacy_id, surname: @provisor.surname }
    assert_redirected_to provisor_path(assigns(:provisor))
  end

  test "should destroy provisor" do
    assert_difference('Provisor.count', -1) do
      delete :destroy, id: @provisor
    end

    assert_redirected_to provisors_path
  end
end
