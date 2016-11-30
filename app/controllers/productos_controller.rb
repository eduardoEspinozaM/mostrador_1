class ProductosController < ApplicationController
  skip_before_filter :authenticate_usuario!, only: [:agregar, :eliminar]
  before_action :set_producto, only: [:show, :edit, :update, :destroy]

  # GET /productos
  # GET /productos.json
  def index
    #@productos = Producto.all
    # Filtramos los productos para poder utilizarlo en nuestro buscador
    @productos = Producto.where(["nombre LIKE ?","%#{params[:Buscar]}%"])
  end

  #metodo para agregar producto a nuestro carrito
  # Crear un ajax para realizar eso.
  def agregar
    #cookies.delete :presupuesto_id
    if cookies[:presupuesto_id]
       presupuesto_id = cookies[:presupuesto_id]# La cookies guarda el presupuesto id dentro de si mismo 
       @presupuesto = Presupuesto.find(presupuesto_id)
    else
       @presupuesto = Presupuesto.new(fecha: DateTime.now)
    end
    puts params.inspect
    producto = Producto.find(params[:id])
    detalle =  @presupuesto.detallepresupuestos.where(producto_id: producto.id ).first
    if detalle
      detalle.cantidad +=1
    else
      @presupuesto.detallepresupuestos.build(cantidad: 1, producto_id: producto.id)
    end
     
      puts detalle.inspect
      puts @presupuesto.inspect

    detalle.save if detalle
    if @presupuesto.save
      # setear la cookies
      cookies[:presupuesto_id] = @presupuesto.id
      msg = "Se ha agregado #{producto.nombre} correctamente "
      flash[:notice] =  msg
      #flash.now  Esto se usa para render 
    else
      msg = "No se ha guardado #{producto.nombre} correctamente "
      flash[:error] =  msg
    end
      #redirect_to presupuesto_path(@presupuesto)
      redirect_to tienda_index_path
  end
  #detalle.save  
  # GET /productos/1
  # GET /productos/1.json
  def show
    
  end

  # GET /productos/new
  def new
    @producto = Producto.new
  end

  # GET /productos/1/edit
  def edit
  end

  # POST /productos
  # POST /productos.json
  def create
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: 'Producto was successfully created.' }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productos/1
  # PATCH/PUT /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to @producto, notice: 'Producto was successfully updated.' }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    #cookies.delete :presupuesto_id
    detalle.destroy
    respond_to do |format|
      format.html { redirect_to tienda_show_path, notice: 'Estas Seguro de eliminar el presupuesto' }
      format.json { head :no_content }
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def producto_params
      params.require(:producto).permit(:nombre,:categoria_id, :foto, :cantidad, :precio, :descripcion)
    end
end
