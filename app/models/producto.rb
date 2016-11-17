require 'carrierwave/orm/activerecord'
class Producto < ActiveRecord::Base
	validates :nombre, :categoria_id, presence: true
	belongs_to :categoria
	belongs_to :marca
	has_many :detallepresupuestos
	mount_uploader :foto, ImagenUploader

end
