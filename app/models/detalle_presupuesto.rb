class DetallePresupuesto < ActiveRecord::Base
	belongs_to :presupuesto
	belongs_to :productos

end
