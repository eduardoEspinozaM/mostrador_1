class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.integer :categoria_id
      t.string :foto
      t.integer :cantidad
      t.integer :precio
      t.string :vendedor
      t.text :descripcion

      t.timestamps null: false
    end
  end
end
