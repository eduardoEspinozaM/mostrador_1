class Detalle_presupuesto < ActiveRecord::Base
	belongs_to :presupuesto
	belongs_to :producto

end
