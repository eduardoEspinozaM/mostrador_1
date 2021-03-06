class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
layout :layout_by_resource
protect_from_forgery with: :exception
before_action :authenticate_usuario!

protected

def layout_by_resource
  if devise_controller? && resource_name == :usuario && action_name == "new"
    "login"
  else
    "application"
  end
end

end
