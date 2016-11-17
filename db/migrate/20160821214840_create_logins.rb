class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :usuario
      t.string :contrasena

      t.timestamps null: false
    end
  end
end
