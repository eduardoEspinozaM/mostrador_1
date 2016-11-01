class TiendasController < ApplicationController
  

  # GET /tiendas
  # GET /tiendas.json
  def index
    @productos = Producto.all
  end
  def show
  	@presupuesto = Presupuesto.includes(detalle_presupuestos:[:producto]).find(cookies[:presupuesto_id])
  end

end