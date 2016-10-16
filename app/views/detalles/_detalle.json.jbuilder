json.extract! detalle, :id, :carrito_id, :producto_id, :cantidad, :created_at, :updated_at
json.url detalle_url(detalle, format: :json)