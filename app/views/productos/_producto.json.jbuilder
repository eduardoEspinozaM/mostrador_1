json.extract! producto, :id,marca_id, :nombre, :categoria_id, :foto, :cantidad, :precio, :vendedor, :descripcion, :created_at, :updated_at
json.url producto_url(producto, format: :json)