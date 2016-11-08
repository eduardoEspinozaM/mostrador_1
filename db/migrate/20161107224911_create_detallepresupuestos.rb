class CreateDetallepresupuestos < ActiveRecord::Migration
  def change
    create_table :detallepresupuestos do |t|
      t.string :cantidad
      

      t.timestamps null: false
    end
  end
end
