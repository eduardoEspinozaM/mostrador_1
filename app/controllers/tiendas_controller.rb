class TiendasController < ApplicationController
  

  # GET /tiendas
  # GET /tiendas.json
  def index
    @productos = Producto.all
  end

end