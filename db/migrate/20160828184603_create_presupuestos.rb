class CreatePresupuestos < ActiveRecord::Migration
  def change
    create_table :presupuestos do |t|
      t.string :fecha

      t.timestamps null: false
    end
  end
end
