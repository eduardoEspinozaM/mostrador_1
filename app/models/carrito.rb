class Carrito < ActiveRecord::Base
	has_many :detalles
	belongs_to :cliente
	belongs_to :productos
	mount_uploader :imagen, ImagenUploader
	has_many :productos, through: :detalles
	belongs_to :marca
	belongs_to :categoria
	validates :cliente_id,  presence: true

	accepts_nested_attributes_for :detalles, allow_destroy: true
end
