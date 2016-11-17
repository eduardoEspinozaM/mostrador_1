class AddProductoIdToDetallepresupuestos < ActiveRecord::Migration
  def change
    add_column :detallepresupuestos, :producto_id, :integer
    add_foreign_key(:detallepresupuestos, :productos) 
  end
end
