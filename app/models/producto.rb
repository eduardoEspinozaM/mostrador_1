require 'carrierwave/orm/activerecord'
class Producto < ActiveRecord::Base
	mount_uploader :imagen, ImagenUploader
	belongs_to :marca
	belongs_to :categoria
	belongs_to :presupuestos
	belongs_to :detalle_presupuestos
	validates :categoria, presence: true
end
