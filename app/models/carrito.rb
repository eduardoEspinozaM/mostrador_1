class Carrito < ActiveRecord::Base
	has_many :detalles
	belongs_to :cliente
	has_many :productos, through: :detalles

	validates :cliente_id,  presence: true

	accepts_nested_attributes_for :detalles, allow_destroy: true
end
