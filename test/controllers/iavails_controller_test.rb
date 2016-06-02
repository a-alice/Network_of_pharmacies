require 'test_helper'

class IavailsControllerTest < ActionController::TestCase
  setup do
    @iavail = iavails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iavails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iavail" do
    assert_difference('Iavail.count') do
      post :create, iavail: { drug_id: @iavail.drug_id, pharmacy_id: @iavail.pharmacy_id, quantity: @iavail.quantity }
    end

    assert_redirected_to iavail_path(assigns(:iavail))
  end

  test "should show iavail" do
    get :show, id: @iavail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iavail
    assert_response :success
  end

  test "should update iavail" do
    patch :update, id: @iavail, iavail: { drug_id: @iavail.drug_id, pharmacy_id: @iavail.pharmacy_id, quantity: @iavail.quantity }
    assert_redirected_to iavail_path(assigns(:iavail))
  end

  test "should destroy iavail" do
    assert_difference('Iavail.count', -1) do
      delete :destroy, id: @iavail
    end

    assert_redirected_to iavails_path
  end
end
