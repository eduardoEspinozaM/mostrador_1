class Presupuesto < ActiveRecord::Base
	has_many :detallepresupuestos, autosave: true, dependent: :destroy
	has_many :productos, through: :detallepresupuestos
end
