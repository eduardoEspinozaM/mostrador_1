class AddPresupuestoIdToDetallepresupuestos < ActiveRecord::Migration
  def change
    add_column :detallepresupuestos, :presupuesto_id, :integer
  end
end
