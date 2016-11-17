class Detallepresupuesto < ActiveRecord::Base
	belongs_to :presupuesto
	belongs_to :producto
end
