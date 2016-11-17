class AgregarClaveForaneaAPresupuesto < ActiveRecord::Migration
  def change
  	add_foreign_key(:presupuestos, :detallepresupuesto) #si no se sigue la convencion nombrarle a la tabla que corresponda Ejemplo: :cat_id
  end
end
