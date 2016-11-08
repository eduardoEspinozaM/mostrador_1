class TiendaController < ApplicationController
skip_before_filter :authenticate_usuario!
  def index
  	 @productos = Producto.all
  	 @presupuesto = Presupuesto.all
  end
  #mostrar los presupuestos
  # VARIABLE INTANCIA SON con @ y se pueden usar en las vistas ---  y las que no es local
  def show
  	@presupuesto = Presupuesto.includes(detallepresupuestos:[:producto]).find(cookies[:presupuesto_id])
  end
end