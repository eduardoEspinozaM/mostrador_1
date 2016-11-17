json.extract! login, :id, :usuario, :contrasena, :created_at, :updated_at
json.url login_url(login, format: :json)