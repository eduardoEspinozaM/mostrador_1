class CreateDetallePresupuestos < ActiveRecord::Migration
  def change
    create_table :detalle_presupuestos do |t|
      t.integer :cantidad

      t.timestamps null: false
    end
  end
end
