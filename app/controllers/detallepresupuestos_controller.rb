class DetallepresupuestosController < ApplicationController
  skip_before_filter :authenticate_usuario!
  before_action :set_detallepresupuesto, only: [:show, :edit, :update, :destroy]

  # GET /detallepresupuestos
  # GET /detallepresupuestos.json
  def index
    @detallepresupuestos = Detallepresupuesto.all
  end

  # GET /detallepresupuestos/1
  # GET /detallepresupuestos/1.json
  def show
  end

  # GET /detallepresupuestos/new
  def new
    @detallepresupuesto = Detallepresupuesto.new
  end

  # GET /detallepresupuestos/1/edit
  def edit
  end

  # POST /detallepresupuestos
  # POST /detallepresupuestos.json
  def create
    @detallepresupuesto = Detallepresupuesto.new(detallepresupuesto_params)

    respond_to do |format|
      if @detallepresupuesto.save
        format.html { redirect_to @detallepresupuesto, notice: 'Detallepresupuesto was successfully created.' }
        format.json { render :show, status: :created, location: @detallepresupuesto }
      else
        format.html { render :new }
        format.json { render json: @detallepresupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detallepresupuestos/1
  # PATCH/PUT /detallepresupuestos/1.json
  def update
    respond_to do |format|
      if @detallepresupuesto.update(detallepresupuesto_params)
        format.html { redirect_to @detallepresupuesto, notice: 'Detallepresupuesto was successfully updated.' }
        format.json { render :show, status: :ok, location: @detallepresupuesto }
      else
        format.html { render :edit }
        format.json { render json: @detallepresupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detallepresupuestos/1
  # DELETE /detallepresupuestos/1.json
  def destroy
    @detallepresupuesto.destroy
    respond_to do |format|
      format.html { redirect_to  tienda_show_path, notice: 'Detallepresupuesto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detallepresupuesto
      @detallepresupuesto = Detallepresupuesto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detallepresupuesto_params
      params.require(:detallepresupuesto).permit(:cantidad)
    end
end
