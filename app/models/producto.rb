require 'carrierwave/orm/activerecord'
class Producto < ActiveRecord::Base
	belongs_to :carrito
	mount_uploader :imagen, ImagenUploader
	belongs_to :marca
	belongs_to :categoria
	validates :categoria, presence: true
end
