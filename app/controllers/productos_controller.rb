class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit, :update, :destroy]

  # GET /productos
  # GET /productos.json
  def index
    @productos = Producto.all
  end

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
  def agregar
    # cookies.delete :presupuesto_id
    if cookies[:presupuesto_id] # La cookies guarda el presupuesto id dentro de si mismo 

      # Utilizar find para buscar por id almacenada en la cookies
      @presupuesto = Presupuesto.find_by_id(cookies[:presupuesto_id])

      # Aqui preguntamos si el producto no existe si es si crea un nuevo presupuestos
        if @presupuesto.nil?
          @presupuesto = Presupuesto.new(fecha: DateTime.now)
        end
    # Si no encuentra nada en la cookies realiza lo siguiente
    else
      @presupuesto = Presupuesto.new(fecha: DateTime.now)
    end
      
    # Creamos una nueva variable para poder obtener los detalles que existe dentro de un 
    # presupuesto que fue almacenado en la cookies 
    detalle =  @presupuesto.detallepresupuestos.where(producto_id: params[:id]).first
    if detalle
      # Utilizamos para ir agregando mas productos 
      #detalle.cantidad = detalle.cantidad + 1
      detalle.cantidad +=  1
      # detalle.cantidad -=  1 #Eliminar detalles if detalle.cantidad == o detalle.destroy 
    else
      #Utilizar la relacion que existe entre presupuesto y detalle presupuesto 
      @presupuesto.detallepresupuestos.build(cantidad:2, producto_id: params[:id])
    end
      # un ActiveRecord son lo que heredan de la base de datos find where etc
    #Creamos la variable para obtener el nombre del producto para mostrar en el mensaje
    producto = Producto.find(params[:id])
    if @presupuesto.save!
      # setear la cookies
      cookies[:presupuesto_id] = @presupuesto.id

      msg = "Se ha agregado #{producto.nombre} correctamente "
      flash[:notice] =  msg
      #flash.now  Esto se usa para render 
    else
      msg = "No se ha guardado #{producto.nombre} correctamente "
      flash[:error] =  msg
    end
      redirect_to presupuesto_path(@presupuesto)
      #redirect_to tienda_index_path
  
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
    @producto.destroy
    respond_to do |format|
      format.html { redirect_to productos_url, notice: 'Producto was successfully destroyed.' }
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
      params.require(:producto).permit(:marca_id, :categoria_id, :nombre, :descripcion, :imagen, :precio)
    end
end
