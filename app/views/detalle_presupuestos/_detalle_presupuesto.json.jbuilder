json.extract! detalle_presupuesto, :id, :cantidad, :created_at, :updated_at
json.url detalle_presupuesto_url(detalle_presupuesto, format: :json)