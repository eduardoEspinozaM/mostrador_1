class Marca < ActiveRecord::Base
	validates :nombre, presence: true 
	has_many :productos
end