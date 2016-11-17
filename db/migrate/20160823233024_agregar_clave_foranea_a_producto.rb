class AgregarClaveForaneaAProducto < ActiveRecord::Migration
  def change
  	add_foreign_key(:productos, :categorias) #si no se sigue la convencion nombrarle a la tabla que corresponda Ejemplo: :cat_id
  end
end
