class Categoria < ActiveRecord::Base
	validates :nombre, presence: true #si necesitamos validar mas campos se separa con comas 
	has_many :productos
end
