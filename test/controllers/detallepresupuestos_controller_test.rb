require 'test_helper'

class DetallepresupuestosControllerTest < ActionController::TestCase
  setup do
    @detallepresupuesto = detallepresupuestos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detallepresupuestos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detallepresupuesto" do
    assert_difference('Detallepresupuesto.count') do
      post :create, detallepresupuesto: { cantidad: @detallepresupuesto.cantidad }
    end

    assert_redirected_to detallepresupuesto_path(assigns(:detallepresupuesto))
  end

  test "should show detallepresupuesto" do
    get :show, id: @detallepresupuesto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detallepresupuesto
    assert_response :success
  end

  test "should update detallepresupuesto" do
    patch :update, id: @detallepresupuesto, detallepresupuesto: { cantidad: @detallepresupuesto.cantidad }
    assert_redirected_to detallepresupuesto_path(assigns(:detallepresupuesto))
  end

  test "should destroy detallepresupuesto" do
    assert_difference('Detallepresupuesto.count', -1) do
      delete :destroy, id: @detallepresupuesto
    end

    assert_redirected_to detallepresupuestos_path
  end
end
