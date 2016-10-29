class CreateTiendas < ActiveRecord::Migration
  def change
    create_table :tiendas do |t|

      t.timestamps null: false
    end
  end
end
