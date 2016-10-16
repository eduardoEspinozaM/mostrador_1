class Detalle < ActiveRecord::Base
	has_many :carritos
	has_many :productos
end
