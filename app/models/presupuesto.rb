class Presupuesto < ActiveRecord::Base
	validates :fecha, presence: true
	has_many :detallepresupuestos, autosave: true, dependent: :destroy
	has_many :productos, through: :detallepresupuestos

end
