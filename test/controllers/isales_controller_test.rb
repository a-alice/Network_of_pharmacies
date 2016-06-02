require 'test_helper'

class IsalesControllerTest < ActionController::TestCase
  setup do
    @isale = isales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:isales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create isale" do
    assert_difference('Isale.count') do
      post :create, isale: { date_sale: @isale.date_sale, drug_id: @isale.drug_id, pharmacy_id: @isale.pharmacy_id, provisor_id: @isale.provisor_id, quantity: @isale.quantity }
    end

    assert_redirected_to isale_path(assigns(:isale))
  end

  test "should show isale" do
    get :show, id: @isale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @isale
    assert_response :success
  end

  test "should update isale" do
    patch :update, id: @isale, isale: { date_sale: @isale.date_sale, drug_id: @isale.drug_id, pharmacy_id: @isale.pharmacy_id, provisor_id: @isale.provisor_id, quantity: @isale.quantity }
    assert_redirected_to isale_path(assigns(:isale))
  end

  test "should destroy isale" do
    assert_difference('Isale.count', -1) do
      delete :destroy, id: @isale
    end

    assert_redirected_to isales_path
  end
end
