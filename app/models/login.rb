class Login < ActiveRecord::Base
	validates :usuario, :contrasena, presence: true
end
