require 'test_helper'

class DetallePresupuestosControllerTest < ActionController::TestCase
  setup do
    @detalle_presupuesto = detalle_presupuestos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalle_presupuestos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalle_presupuesto" do
    assert_difference('DetallePresupuesto.count') do
      post :create, detalle_presupuesto: { cantidad: @detalle_presupuesto.cantidad }
    end

    assert_redirected_to detalle_presupuesto_path(assigns(:detalle_presupuesto))
  end

  test "should show detalle_presupuesto" do
    get :show, id: @detalle_presupuesto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalle_presupuesto
    assert_response :success
  end

  test "should update detalle_presupuesto" do
    patch :update, id: @detalle_presupuesto, detalle_presupuesto: { cantidad: @detalle_presupuesto.cantidad }
    assert_redirected_to detalle_presupuesto_path(assigns(:detalle_presupuesto))
  end

  test "should destroy detalle_presupuesto" do
    assert_difference('DetallePresupuesto.count', -1) do
      delete :destroy, id: @detalle_presupuesto
    end

    assert_redirected_to detalle_presupuestos_path
  end
end
