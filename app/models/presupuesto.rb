class Presupuesto < ActiveRecord::Base
	has_many :detalle_presupuestos, autosave: true, dependent: :destroy
	has_many :productos, through: :detalle_presupuestos
end
