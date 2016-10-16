class CreateCarritos < ActiveRecord::Migration
  def change
    create_table :carritos do |t|
      t.integer :cliente_id
      t.integer :total

      t.timestamps null: false
    end
  end
end
