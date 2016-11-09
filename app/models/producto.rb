require 'carrierwave/orm/activerecord'
class Producto < ActiveRecord::Base
	mount_uploader :imagen, ImagenUploader
	belongs_to :marca
	belongs_to :categoria
	belongs_to :presupuesto
	has_many :detallepresupuestos
	validates :categoria, presence: true
end
