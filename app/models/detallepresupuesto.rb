class Detallepresupuesto < ActiveRecord::Base
	validates :cantidad, presence: true
	belongs_to :presupuesto
	belongs_to :producto
end
