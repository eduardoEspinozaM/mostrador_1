class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.integer :marca_id
      t.integer :categoria_id
      t.string :nombre
      t.string :descripcion
      t.string :imagen
      t.integer :precio

      t.timestamps null: false
    end
  end
end
