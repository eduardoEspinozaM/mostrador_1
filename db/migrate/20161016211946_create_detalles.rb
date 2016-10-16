class CreateDetalles < ActiveRecord::Migration
  def change
    create_table :detalles do |t|
      t.integer :carrito_id
      t.integer :producto_id
      t.integer :cantidad

      t.timestamps null: false
    end
  end
end
