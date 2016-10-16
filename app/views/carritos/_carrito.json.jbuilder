json.extract! carrito, :id, :cliente_id, :total, :created_at, :updated_at
json.url carrito_url(carrito, format: :json)