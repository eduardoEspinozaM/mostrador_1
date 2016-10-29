class Tienda < ActiveRecord::Base
	belongs_to :marca
	belongs_to :categoria
	belongs_to :productos
	mount_uploader :imagen, ImagenUploader
end
